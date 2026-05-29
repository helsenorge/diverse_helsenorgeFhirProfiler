Instance: example-slot-1
InstanceOf: HnBasisSlot
Usage: #example
* id = "123e4567-e89b-12d3-a456-426614174000"
* identifier.system = "urn:ietf:rfc:3986"
* identifier.value = "urn:uuid:123e4567-e89b-12d3-a456-426614174000"
* serviceCategory.coding.system = "http://terminology.hl7.org/CodeSystem/service-category"
* serviceCategory.coding.code = #27
* serviceType.coding.system = "http://helsenorge.no/fhir/CodeSystem/hn-scheduleAndSlot-type-cs"
* serviceType.coding.code = #Konsultasjon
* appointmentType.coding.system = "http://helsenorge.no/fhir/CodeSystem/hn-scheduleAndSlot-type-cs"
* appointmentType.coding.code = #Konsultasjon
* schedule = Reference(Schedule/example-schedule-1)
* status = #free
* start = "2026-06-01T09:00:00+02:00"
* end = "2026-06-01T09:30:00+02:00"
