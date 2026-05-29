param(
    [string]$ResourcesPath = "fsh-generated/resources",
    [string]$PackageId = "no.nhn.fhir.helsenorge.profiles",
    [string]$PackageVersion = "0.1.0"
)

$ErrorActionPreference = "Stop"
$root = Split-Path -Parent $PSScriptRoot
Set-Location $root
$rootLockPath = Join-Path $root "fhirpkg.lock.json"
$rootLockExisted = Test-Path $rootLockPath
$rootLockBytes = $null
if ($rootLockExisted) {
    $rootLockBytes = [System.IO.File]::ReadAllBytes($rootLockPath)
}

$fhirCommand = Get-Command fhir -ErrorAction SilentlyContinue
if (-not $fhirCommand) {
    $dotnetToolCommand = Join-Path $env:USERPROFILE ".dotnet\tools\fhir.exe"
    if (Test-Path $dotnetToolCommand) {
        $fhirCommand = $dotnetToolCommand
    }
}

if (-not $fhirCommand) {
    throw "Firely Terminal command 'fhir' was not found on PATH or in %USERPROFILE%\.dotnet\tools. Install Firely Terminal and restart the shell."
}

if (-not (Test-Path $ResourcesPath)) {
    throw "Resources path '$ResourcesPath' does not exist. Run scripts/build-sushi.ps1 first."
}

$jsonFiles = Get-ChildItem -Path $ResourcesPath -Filter "*.json" -File
if ($jsonFiles.Count -eq 0) {
    throw "No JSON resources found in '$ResourcesPath'. Run scripts/build-sushi.ps1 first."
}

$implementationGuideFile = $jsonFiles | Where-Object { $_.Name -like "ImplementationGuide-*.json" } | Select-Object -First 1
if (-not $implementationGuideFile) {
    throw "No generated ImplementationGuide JSON found in '$ResourcesPath'. Run scripts/build-sushi.ps1 first."
}

$resourcesByReference = @{}
foreach ($file in $jsonFiles) {
    $json = Get-Content -Raw -LiteralPath $file.FullName | ConvertFrom-Json
    if ($json.resourceType -and $json.id) {
        $resourcesByReference["$($json.resourceType)/$($json.id)"] = $file
    }
}

$implementationGuide = Get-Content -Raw -LiteralPath $implementationGuideFile.FullName | ConvertFrom-Json
$exampleReferences = @(
    $implementationGuide.definition.resource |
        Where-Object { $_.exampleCanonical -or $_.exampleBoolean -eq $true } |
        ForEach-Object { $_.reference.reference }
) | Where-Object { $_ }

if ($exampleReferences.Count -eq 0) {
    throw "No examples found in '$($implementationGuideFile.Name)'."
}

$exampleFiles = @()
foreach ($reference in $exampleReferences) {
    if (-not $resourcesByReference.ContainsKey($reference)) {
        throw "Example '$reference' is listed in '$($implementationGuideFile.Name)' but no generated JSON file was found for it."
    }

    $exampleFiles += $resourcesByReference[$reference]
}

Write-Host "Validating generated example JSON resources with Firely Terminal..."
Write-Host "Resources: $ResourcesPath"
Write-Host "Examples: $($exampleFiles.Count)"

$validationRoot = Join-Path $root ".firely-example-validation"
$validationResources = Join-Path $validationRoot "resources"

if (Test-Path $validationRoot) {
    Remove-Item -LiteralPath $validationRoot -Recurse -Force
}

New-Item -ItemType Directory -Force -Path $validationResources | Out-Null
foreach ($file in $jsonFiles) {
    Copy-Item -LiteralPath $file.FullName -Destination $validationResources -Force
}

Push-Location $validationRoot
try {
    $output = & $fhirCommand init $PackageId $PackageVersion 2>&1
    $exitCode = $LASTEXITCODE
    $output | Out-Host
    if ($exitCode -ne 0) {
        throw "Firely project initialization failed."
    }

    $output = & $fhirCommand spec R4 --project 2>&1
    $exitCode = $LASTEXITCODE
    $output | Out-Host
    if ($exitCode -ne 0 -or ($output -match "encountered errors") -or ($output -match "\[Missing\]")) {
        throw "Firely R4 specification restore failed."
    }

    $sushiConfig = Join-Path $root "sushi-config.yaml"
    if (Test-Path $sushiConfig) {
        $packageJsonPath = Join-Path $validationRoot "package.json"
        $packageJson = Get-Content -Raw -LiteralPath $packageJsonPath | ConvertFrom-Json

        $dependencies = [ordered]@{}
        foreach ($property in $packageJson.dependencies.PSObject.Properties) {
            $dependencies[$property.Name] = $property.Value
        }

        $inDependencies = $false
        foreach ($line in Get-Content -LiteralPath $sushiConfig) {
            if ($line -match '^dependencies:\s*$') {
                $inDependencies = $true
                continue
            }

            if ($inDependencies -and $line -match '^\S') {
                break
            }

            if ($inDependencies -and $line -match '^\s{2}([^:#]+):\s*([^\s#]+)') {
                $dependencies[$Matches[1].Trim()] = $Matches[2].Trim()
            }
        }

        $packageJson.dependencies = $dependencies
        $packageJson | ConvertTo-Json -Depth 10 | Set-Content -LiteralPath $packageJsonPath -Encoding utf8
    }

    $output = & $fhirCommand restore 2>&1
    $exitCode = $LASTEXITCODE
    $output | Out-Host
    if ($exitCode -ne 0 -or ($output -match "encountered errors") -or ($output -match "\[Missing\]")) {
        throw "Firely package restore failed."
    }

    $validationFailed = $false

    foreach ($file in $exampleFiles) {
        $relativeFile = Join-Path "resources" $file.Name
        Write-Host "Validating $relativeFile"
        $output = & $fhirCommand validate $relativeFile 2>&1
        $exitCode = $LASTEXITCODE
        $output | Out-Host

        if ($exitCode -ne 0 -or ($output -match "Result:\s*INVALID") -or ($output -match "No resource was found")) {
            $validationFailed = $true
        }
    }

    if ($validationFailed) {
        throw "Firely example validation failed."
    }
}
finally {
    Pop-Location

    if ($rootLockExisted) {
        [System.IO.File]::WriteAllBytes($rootLockPath, $rootLockBytes)
    }
    elseif (Test-Path $rootLockPath) {
        Remove-Item -LiteralPath $rootLockPath -Force
    }
}

Write-Host "Firely example validation completed."
