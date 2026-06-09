CodeSystem: HnAppointmentFlagCodeCS
Id: hn-appointment-flag-code-cs
Title: "hn-appointment-flag-code-cs"
Description: "Code system used for Flag codes in nytimeløsing"
* ^version = "1.0.2"
* ^status = #draft
* ^experimental = false
* ^date = "2025-12-02T14:53:52+01:00"
* ^publisher = "Example Publisher"
* ^contact.name = "Example Publisher"
* ^contact.telecom.system = #url
* ^contact.telecom.value = "http://example.org/example-publisher"
* ^caseSensitive = true
* ^content = #complete
* ^count = 10
* #cancel "Innbygger kan kansellere timen"
* #cancelWithComment "Innbygger kan kansellere timen, med kommentar"
* #canChangeAppointmentDialog "Innbygger kan be om endret time (Dialogmeldinger)"
* #canUseShortNotice "Innbygger kan komme på kort varsel"
* #canCancelServiceRequest "Innbygger kan be om at behandlingsløp avsluttes"
* #canChangeConferenceType "Innbygger kan be om endret konferanse type"
* #canAcknowledge "Timen/opphold kan bekreftes av innbygger"
* #canChangeAppointment "Innbygger kan be om endret time"
* #canHaveAppointmentDetails "Det finnes ytterlege timedetaljer på time/timeavtale som kan hentes"
* #canInitiateDialog "Dialog kan inisieres"