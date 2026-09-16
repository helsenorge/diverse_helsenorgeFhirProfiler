Invariant: virtualservice-or-location-required
Description: "For appointments that are not part of another appointment, either virtual service or at least one Location must be present."
* severity = #error
* expression = "
extension.where(
  url='http://hl7.no/fhir/StructureDefinition/no-basis-partof'
).exists()
or
extension.where(
  url='http://hl7.no/fhir/StructureDefinition/no-basis-virtual-service'
).exists()
or
contained.ofType(Location).exists()
"