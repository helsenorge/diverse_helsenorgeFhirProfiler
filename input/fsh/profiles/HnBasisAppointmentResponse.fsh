Profile: HnBasisAppointmentResponse
Parent: NoBasisAppointmentResponse
Id: hn-basis-AppointmentResponse
Title: "hn-basis-AppointmentResponse"
Description: "Basisprofil for AppointmentResponse used in 'ny timeløsning'."
* ^version = "1.0.1"
* ^status = #active
* extension contains
    HnBasisChangeConferenceType named changeConferenceType 0..1 and
    HnBasisRequestedSlot named requestedSlot 0..1

* extension[requestedSlot] ^short = "Requested Slot for appointment change"
* extension[requestedSlot] ^definition = "Reference to the HnBasisSlot selected by the patient when requesting a change of appointment."

* extension[changeConferenceType] ^definition = "Patient can ask for anouther type of conference"
* extension[changeConferenceType].value[x] ^definition = "Type of conference that Patient askes for"

* identifier 1..1
* identifier.system 1..
* identifier.value 1..

* appointment.reference ..0

* participantType.coding obeys inv-4

* actor 1..
* actor only Reference(Patient)
* actor ^short = "Use only logical reference"
* actor ^definition = "Only use of logical reference is allowed for reference to an patient in this profile"
* actor.reference ..0
* actor.type 1..
* actor.type = "Patient"
* actor.identifier 1..
* actor.identifier obeys inv-a
* actor.identifier.type.coding obeys inv-3
* actor.identifier.system 1..
* actor.identifier.value 1..