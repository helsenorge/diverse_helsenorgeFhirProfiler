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
* serviceCategory 1..1
* serviceCategory from ServiceCategory (preferred)
* serviceCategory.coding obeys inv-4
* serviceType from HnAppointmentTypeInnbyggerVS (required)
* serviceType.coding obeys inv-4
* specialty.coding obeys inv-4
* appointmentType from HnAppointmentTypeInnbyggerVS (required)
* appointmentType.coding obeys inv-4
* schedule only Reference(Schedule or HnBasisSchedule)