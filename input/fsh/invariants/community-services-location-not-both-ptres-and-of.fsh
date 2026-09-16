Invariant: community-services-location-not-both-ptres-and-of
Description: "When serviceCategory is 3, 4, 5, 6, 7, 8, 9, 10, 16, 17, 18 or 19, the appointment is not partOf another appointment, and virtualService is not present, contained Location must not include both PTRES and OF."
* severity = #error
* expression = "serviceCategory.coding.where(code in ('3' | '4' | '5' | '6' | '7' | '8' | '9' | '10' | '16' | '17' | '18' | '19')).empty() or extension('http://hl7.no/fhir/StructureDefinition/no-basis-partof').exists() or 
    extension('http://hl7.no/fhir/StructureDefinition/no-basis-virtual-service').exists()
    or (contained.ofType(Location).where(type.coding.where(system = 'http://terminology.hl7.org/CodeSystem/v3-RoleCode' and code = 'PTRES').exists()).exists() and contained.ofType(Location).where(type.coding.where(system = 'http://terminology.hl7.org/CodeSystem/v3-RoleCode' and code = 'OF').exists()).exists()).not()"