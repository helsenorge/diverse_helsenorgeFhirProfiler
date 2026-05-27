Instance: example-slot-3
InstanceOf: HnBasisSlot
Usage: #example
* id = "123e4567-e89b-12d3-a456-426614174011"
* identifier[0].system = "urn:ietf:rfc:3986"
* identifier[0].value = "urn:uuid:999e4567-e89b-12d3-a456-426614174010"
* serviceCategory[0].coding[0].system = "http://terminology.hl7.org/CodeSystem/service-category"
* serviceCategory[0].coding[0].code = #27
* serviceType[0].coding[0].system = "urn:oid:2.16.578.1.12.4.1.1.7617" (exactly)    
* serviceType[0].coding[0].code = #Vaksine
* appointmentType.coding[0].system = "urn:oid:2.16.578.1.12.4.1.1.7617" (exactly)
* appointmentType.coding[0].code = #Vaksine
* schedule = Reference(Schedule/987e4567-e89b-12d3-a456-426614174010)
* status = #free
* start = "2026-06-01T09:00:00+02:00"
* end = "2026-07-01T09:30:00+02:00"