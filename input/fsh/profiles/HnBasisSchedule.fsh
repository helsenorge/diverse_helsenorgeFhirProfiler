Profile: HnBasisSchedule
Parent: Schedule
Id: hn-basis-schedule
Title: "HnBasisSchedule"
Description: "FHIR Schedule brukes for å hente timebøker tilgjengelige for timebestilling for innbygger. Profilen er basert på R4."
* ^version = "1.3.2"
* ^status = #active
* ^jurisdiction = urn:iso:std:iso:3166#NO "Norway"
* extension contains HnExtensionFreeSlotPlanningHorizon named freeSlotPlanningHorizon 0..1
* extension[freeSlotPlanningHorizon] ^short = "DEPRECATED: Free slot planning horizon"
* extension[freeSlotPlanningHorizon] ^definition = "Deprecated. Retained for backwards compatibility. This extension SHALL NOT be used in new implementations."
* identifier 1..1
* identifier ^short = "Identifer must be UUID/GUID"
* identifier ^definition = "Identifer must be UUID/GUID"
* identifier.system 1..
* identifier.value 1..
* identifier.assigner only Reference(Organization or NoBasisOrganization)
* active = true
* serviceCategory from ServiceCategory (preferred)
* serviceCategory.coding obeys inv-4
* serviceCategory.coding.system 1..
* serviceType 1..
* serviceType from HnScheduleTypeVS (required)
* serviceType ^short = "Type timebok"
* serviceType.coding obeys inv-4
* serviceType.coding.system 1..
* specialty.coding obeys inv-4
* actor only Reference(HealthcareService or Practitioner or NoBasisHealthcareService or NoBasisPractitioner)
* actor ^short = "Currently only HealthcareService or Practitioner (basic and no-basic profiles) are referenced as valid actors."
* actor.type 1..
* comment ^short = "Comments regarding the scheduler."
* comment ^definition = "Comments regarding the scheduler including short information about the timebook."