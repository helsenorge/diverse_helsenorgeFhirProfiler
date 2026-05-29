Invariant: supportinginformation-organization-partof
Description: "Every non-kommunikasjonspart Organization referenced from supportingInformation must have a HER-id level 2 identifier and must have partOf referencing an Organization with a HER-id level 1 identifier."
* severity = #error
* expression = "supportingInformation.resolve().ofType(Organization).where(meta.profile != 'http://helsenorge.no/fhir/StructureDefinition/kommunikasjonspart-Organization').all(identifier.where(system = 'urn:oid:2.16.578.1.12.4.1.4.102').exists() and partOf.exists() and partOf.resolve().ofType(Organization).exists() and partOf.resolve().ofType(Organization).all(identifier.where(system = 'urn:oid:2.16.578.1.12.4.1.4.101').exists()))"
