# FHIR IG Project Setup Guide

This guide describes how to create and work with this FHIR IG project scaffold.

## Goal

Use FSH as the source of truth, generate FHIR JSON with SUSHI, validate generated resources with Firely Terminal, review changes in GitHub Pull Requests, and let Simplifier import only generated JSON from the reviewed `main` branch.

The normal build flow generates JSON with SUSHI and validates it with Firely Terminal. IG website generation is available as a manual GitHub Actions workflow.

## Prerequisites

Install:

- VS Code
- Git
- Node.js 20 or newer
- Firely Terminal

Install project dependencies:

```powershell
npm install
```

## Folder Structure

Use this structure:

```text
.
|-- input/
|   |-- fsh/
|   |   |-- codesystems/     # CodeSystem definitions
|   |   |-- examples/        # Example instances
|   |   |-- extensions/      # Extension definitions
|   |   |-- instances/       # Supporting instances, e.g. NamingSystem
|   |   |-- invariants/      # Reusable FHIRPath invariants
|   |   |-- profiles/        # Profile StructureDefinitions
|   |   |-- valuesets/       # ValueSet definitions
|   |   `-- aliases.fsh      # Shared aliases
|   `-- pagecontent/         # Markdown pages for the IG website
|-- fsh-generated/
|   |-- resources/           # Generated JSON committed for Simplifier
|   |-- data/                # Generated support data, not committed
|   |-- includes/            # Generated include files, not committed
|   `-- fsh-index.txt        # Generated SUSHI index, not committed
|-- scripts/
|-- .github/
|   `-- workflows/
|-- sushi-config.yaml
|-- ig.ini
|-- package.json
|-- package-list.json
`-- README.md
```

## Source And Generated Files

Source files:

```text
input/fsh/**/*.fsh
input/pagecontent/**/*.md
sushi-config.yaml
ig.ini
package-list.json
scripts/*.ps1
```

Generated files committed to Git:

```text
fsh-generated/resources/*.json
```

Generated/local files not committed:

```text
node_modules/
input-cache/
output/
temp/
template/
.firely-validation/
fsh-generated/data/
fsh-generated/includes/
fsh-generated/fsh-index.txt
```

Simplifier should import only:

```text
fsh-generated/resources/*.json
```

from the `main` branch.

## Create The Scaffold

Create folders:

```powershell
New-Item -ItemType Directory -Force -Path `
  input/fsh/codesystems, `
  input/fsh/examples, `
  input/fsh/extensions, `
  input/fsh/instances, `
  input/fsh/invariants, `
  input/fsh/profiles, `
  input/fsh/valuesets, `
  input/pagecontent, `
  fsh-generated/resources, `
  scripts, `
  .github/workflows
```

Create or copy these project files:

```text
sushi-config.yaml
ig.ini
package.json
.gitignore
package-list.json
README.md
scripts/build-sushi.ps1
scripts/watch-sushi.ps1
scripts/validate-firely.ps1
scripts/ci.ps1
.github/workflows/sushi-generation.yml
.github/workflows/firely-validation.yml
.github/workflows/pull-request-validation.yml
.github/workflows/build-ig-website.yml
```

For an existing IG converted with GoFSH, copy the GoFSH output folders into:

```text
input/fsh/
```

Do not copy FSH source into:

```text
fsh-generated/resources/
```

That folder is SUSHI output.

## Configure FHIR Dependencies

Put FHIR package dependencies in `sushi-config.yaml`:

```yaml
dependencies:
  hl7.fhir.uv.extensions.r4: 5.2.0
  hl7.fhir.no.basis: 2.2.2
  hl7.terminology.r4: 7.1.0
```

Do not add `hl7.fhir.r4.core` as an explicit dependency. It is already implied by:

```yaml
fhirVersion: 4.0.1
```

Put Node tooling dependencies in `package.json`:

```json
{
  "devDependencies": {
    "fsh-sushi": "^3.16.5"
  }
}
```

## Configure Package Version

The FHIR package version is controlled in `sushi-config.yaml`:

```yaml
version: 2.5.1-beta
releaseLabel: 2.5.1-beta
```

When preparing a new Simplifier package, create a release branch and update the version before generating JSON:

```powershell
git checkout main
git pull origin main
git checkout -b release/2.5.1-beta
```

Then update:

```text
sushi-config.yaml
package-list.json
```

Run:

```powershell
.\scripts\build-sushi.ps1
.\scripts\validate-firely.ps1
.\scripts\validate-examples-firely.ps1
```

Commit and push:

```powershell
git add sushi-config.yaml package-list.json fsh-generated/resources
git commit -m "Prepare 2.5.1-beta package"
git push -u origin release/2.5.1-beta
```

Open a Pull Request:

```text
release/2.5.1-beta -> main
```

After review and successful validation, merge to `main` and let Simplifier import/publish from `main`.

## Build Commands

Generate JSON resources:

```powershell
.\scripts\build-sushi.ps1
```

Watch FSH files and regenerate automatically:

```powershell
npm run watch
```

Validate generated JSON with Firely Terminal:

```powershell
.\scripts\validate-firely.ps1
```

Validate only generated example resources with Firely Terminal:

```powershell
.\scripts\validate-examples-firely.ps1
```

or:

```powershell
npm run validate:examples
```

Run local CI checks:

```powershell
.\scripts\ci.ps1
```

Build the IG website in GitHub Actions manually:

1. Open the repository on GitHub.
2. Go to `Actions`.
3. Select `Build IG Website`.
4. Click `Run workflow`.
5. Download the `ig-output` artifact when the workflow completes.

## Daily Development Flow

1. Edit FSH source under `input/fsh`.
2. Save files in VS Code.
3. Run or keep running:

```powershell
npm run watch
```

4. Review generated JSON under `fsh-generated/resources`.
5. Run validation:

```powershell
.\scripts\validate-firely.ps1
```

6. When editing examples, run example-only validation:

```powershell
npm run validate:examples
```

7. Commit both source and generated JSON.

## Initial GitHub Push

Initialize Git if needed:

```powershell
git init
```

Check whether a remote already exists:

```powershell
git remote -v
```

If no remote is configured, add the GitHub repository URL:

```powershell
git remote add origin https://github.com/helsenorge/diverse_helsenorgeFhirProfiler.git
```

If the clone already points to an old repository location, update `origin`:

```powershell
git remote set-url origin https://github.com/helsenorge/diverse_helsenorgeFhirProfiler.git
git remote -v
```

Stage and commit:

```powershell
git add .
git commit -m "Initial FHIR IG scaffold"
```

For the first push, either push directly to `main`:

```powershell
git branch -M main
git push -u origin main
```

or create a feature branch for Pull Request review:

```powershell
git checkout -b feature/initial-fhir-ig-scaffold
git push -u origin feature/initial-fhir-ig-scaffold
```

Open a Pull Request:

```text
feature/initial-fhir-ig-scaffold -> main
```

## Later Change Flow

Create a new branch from `main`:

```powershell
git checkout main
git pull
git checkout -b feature/my-change
```

After editing, building, and validating:

```powershell
git add .
git commit -m "Describe the change"
git push -u origin feature/my-change
```

Open a Pull Request:

```text
feature/my-change -> main
```

After review and successful validation, merge the Pull Request to `main`.

## Branch Push Troubleshooting

If this command fails:

```powershell
git push -u origin feature2.4.4beta
```

with:

```text
error: src refspec feature2.4.4beta does not match any
```

then the branch name you typed does not exist locally, or you have not committed anything yet.

Check the current branch:

```powershell
git branch --show-current
```

List local branches:

```powershell
git branch
```

Push the current branch without retyping its name:

```powershell
git push -u origin HEAD
```

Or create the intended branch first:

```powershell
git checkout -b feature/2.4.4-beta
git push -u origin feature/2.4.4-beta
```

Prefer branch names with slashes and hyphens:

```text
feature/2.4.4-beta
feature/update-slot-profile
fix/appointment-validation
```

## GitHub Actions

Use workflows for:

- SUSHI generation
- generated JSON freshness check
- Firely validation
- Pull Request validation
- optional manual IG website build

The PR validation should fail if generated JSON is not committed.

## Simplifier Setup

Configure Simplifier GitHub import:

```text
Branch: main
Include: fsh-generated/resources/*.json
```

Do not import:

```text
input/fsh/**
input/pagecontent/**
output/**
node_modules/**
input-cache/**
```

This ensures Simplifier only sees changes after GitHub Pull Request review and validation.

## Important Rules

- FSH is the source of truth.
- Generated JSON is committed because Simplifier imports it.
- Do not manually edit generated JSON.
- Do not place source FSH under `fsh-generated/resources`.
- Use Pull Requests before merging to `main`.
- Run Firely validation before merge.
