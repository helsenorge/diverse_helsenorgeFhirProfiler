Instance: example-slot-1
InstanceOf: HnBasisSlot
Usage: #example
* id = "123e4567-e89b-12d3-a456-426614174000"
* identifier[0].system = "urn:ietf:rfc:3986"
* identifier[0].value = "urn:uuid:123e4567-e89b-12d3-a456-426614174000"
* serviceCategory[0].coding[0].system = "http://terminology.hl7.org/CodeSystem/service-category"
* serviceCategory[0].coding[0].code = #27
* serviceType[0].coding[0].system = "urn:oid:2.16.578.1.12.4.1.1.7617"
* serviceType[0].coding[0].code = #Konsultasjon
* appointmentType.coding[0].system = "urn:oid:2.16.578.1.12.4.1.1.7617"
* appointmentType.coding[0].code = #Konsultasjon
* schedule = Reference(Schedule/example-schedule-uuid)
* status = #free
* start = "2026-06-01T09:00:00+02:00"
* end = "2026-06-01T09:30:00+02:00"
