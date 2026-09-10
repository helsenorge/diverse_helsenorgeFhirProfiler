Invariant: root-appointment-requires-patient
Description: "Root appointments must contain a patient participant"
* severity = #error
* expression = "extension('http://hl7.no/fhir/StructureDefinition/no-basis-partof').exists() or
participant.where(
  actor.identifier.where(
    system = 'urn:oid:2.16.578.1.12.4.1.4.1' or
    system = 'urn:oid:2.16.578.1.12.4.1.4.2' or
    system = 'urn:oid:2.16.578.1.12.4.1.4.3'
  ).exists()
).exists()
"