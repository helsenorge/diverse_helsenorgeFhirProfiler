Invariant: community-services-location-requires-ptres-or-of
Description: "For community services, contained Location must include PTRES or OF when virtualService is not present."
* severity = #error
* expression = "serviceCategory.coding.where(
  code = '3' or
  code = '4' or
  code = '5' or
  code = '6' or
  code = '7' or
  code = '8' or
  code = '9' or
  code = '10' or
  code = '16' or
  code = '17' or
  code = '18' or
  code = '19'
).empty()
or extension('http://hl7.no/fhir/StructureDefinition/no-basis-partof').exists()
or extension('http://hl7.no/fhir/StructureDefinition/no-basis-virtual-service').exists()
or contained.ofType(Location).where(
     type.coding.where(
       system = 'http://terminology.hl7.org/CodeSystem/v3-RoleCode'
       and (code = 'PTRES' or code = 'OF')
     ).exists()
   ).exists()"