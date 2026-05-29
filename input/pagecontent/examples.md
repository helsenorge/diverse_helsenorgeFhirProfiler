Example resources are authored as FSH files under `input/fsh/examples`.

Generated example JSON files are written to `fsh-generated/resources`.

Validate generated examples with Firely Terminal before review:

```powershell
npm run validate:examples
```

The example validator discovers examples from the generated ImplementationGuide and validates only those resources against the generated profiles and terminology.
