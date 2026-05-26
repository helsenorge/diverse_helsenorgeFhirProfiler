Invariant: serviceCategory-7-location-requires-ptres-or-of
Description: "When serviceCategory is 7, the appointment is not partOf another appointment, and virtualService is not present, contained Location must include PTRES or OF."
* severity = #error
* expression = "serviceCategory.coding.where(code = '7').empty() or partOf.exists() or extension('http://helsenorge.no/fhir/StructureDefinition/hn-basis-virtual-service').exists() or contained.ofType(Location).where(type.coding.where(system = 'http://terminology.hl7.org/CodeSystem/v3-RoleCode' and (code = 'PTRES' or code = 'OF')).exists()).exists()"

Invariant: serviceCategory-7-location-not-both-ptres-and-of
Description: "When serviceCategory is 7, the appointment is not partOf another appointment, and virtualService is not present, contained Location must not include both PTRES and OF."
* severity = #error
* expression = "serviceCategory.coding.where(code = '7').empty() or partOf.exists() or extension('http://helsenorge.no/fhir/StructureDefinition/hn-basis-virtual-service').exists() or (contained.ofType(Location).where(type.coding.where(system = 'http://terminology.hl7.org/CodeSystem/v3-RoleCode' and code = 'PTRES').exists()).exists() and contained.ofType(Location).where(type.coding.where(system = 'http://terminology.hl7.org/CodeSystem/v3-RoleCode' and code = 'OF').exists()).exists()).not()"
