Invariant: cancelationReason-inv
Description: "Cancellation reason MUST be set when status=cancelled and the appointment is not partOf another appointment"
* severity = #error
* expression = "(status = 'cancelled' and extension('http://hl7.no/fhir/StructureDefinition/no-basis-partof').empty()) implies cancelationReason.exists()"