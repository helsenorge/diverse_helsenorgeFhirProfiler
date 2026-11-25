Profile: HnBasisSlot
Parent: Slot
Id: hn-basis-slot
Title: "HnBasisSlot"
Description: "Profil for slot i Helsenorge. Basert på FHIR Slot (R4)"
* ^version = "1.3.2"
* ^status = #draft
* ^jurisdiction = urn:iso:std:iso:3166#NO "Norway"
* identifier 1..1
* identifier ^short = "Identifer must be UUID/GUID"
* identifier ^definition = "Identifer must be UUID/GUID"
* identifier.system 1..
* identifier.value 1..
* identifier.assigner only Reference(Organization or NoBasisOrganization)
* serviceCategory 0..1
* serviceCategory from ServiceCategory (preferred)
* appointmentType from HnAppointmentTypeInnbyggerVS
* schedule only Reference(Schedule or HnBasisSchedule)