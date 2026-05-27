Invariant: supportinginformation-organization-partof
Description: "When supportingInformation references an Organization, the referenced Organization must use HER-id level 2 identifier system and must have partOf referencing an Organization that uses HER-id level 1 identifier system."
* severity = #error
* expression = "supportingInformation.resolve().ofType(Organization).all(identifier.exists() and identifier.all(system = 'urn:oid:2.16.578.1.12.4.1.4.102') and partOf.exists() and partOf.resolve().ofType(Organization).exists() and partOf.resolve().ofType(Organization).all(identifier.exists() and identifier.all(system = 'urn:oid:2.16.578.1.12.4.1.4.101')))"
