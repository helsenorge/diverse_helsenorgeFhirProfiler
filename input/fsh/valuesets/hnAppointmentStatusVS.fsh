ValueSet: HnAppointmentStatusVS
Id: hn-appointment-status-vs
Title: "Helsenorge Appointment Status Value Set"
Description: "Value set for Helsenorge FHIR appointment status codes."
* ^status = #active
* ^version = "2.1.0"
* ^experimental = false
* AppointmentStatus#booked
* AppointmentStatus#fulfilled
* AppointmentStatus#cancelled
* AppointmentStatus#noshow
* AppointmentStatus#entered-in-error
* AppointmentStatus#proposed
