Profile: KommunikasjonspartOrganization
Parent: Organization
Id: kommunikasjonspart-Organization
Title: "kommunikasjonspart-Organization"
Description: "Use case specific profile for Norwegian services defined in the Norwegian address register, kommunikasjonspart-Organization. Defined by The Norwegian Directorate of eHealth and HL7 Norway. The profile adds Norwegian specific identification of Healthcare services as defined in the Norwegian adress register. The use-case profile is specific for the use case of identifying relevant services defined in the address register for electronic communication."
* ^version = "1.0.1"
* ^status = #draft
* ^date = "2019-05-15"
* . ^definition = "The details of a kommunikasjonspart (communication party) defined in the Norwegian Address Registry for Health care. \r\n\r\nOther kinds of healthcare services not registered in Adresseregisteret (clinical services) shold not use this profile. The standard HL7 Resource or the no-basis-HealthcareService can be used."
* . ^comment = "Definition of \"kommunikasjonspart\" from the Standard HIS 1153-1:2016 (Norwegian text only):\r\nLogisk avgrenset del av en virksomhet i helse- og omsorgstjenesten, som sender og/eller mottar elektroniske meldinger.\r\nMerk 1: En kommunikasjonspart har alltid en HER-id.\r\nMerk 2: En kommunikasjonspart vil som hovedregel være knyttet til en tjenestetype."
* . ^alias[0] = "kommunikasjonspart"
* extension contains TbaOrganizationcoverage named organizationcoverage 0..*
* extension[organizationcoverage] ^alias[0] = "dekningsområde"
* extension[organizationcoverage] ^alias[+] = "user content"
* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "system"
* identifier ^slicing.rules = #open
* identifier ..1
* identifier.system ^short = "The official name of the RESH id namespace"
* identifier contains
    ENH 0..1 and
    RSH 0..1 and
    HER 1..1
* identifier[ENH] ..1
* identifier[ENH].system 1..
* identifier[ENH].system = "urn:oid:2.16.578.1.12.4.1.4.101" (exactly)
* identifier[ENH].value 1..
* identifier[RSH] ..1
* identifier[RSH].system 1..
* identifier[RSH].system = "urn:oid:2.16.578.1.12.4.1.4.102" (exactly)
* identifier[RSH].value 1..
* identifier[HER] ^definition = "HER id for this tba-Organization, should be identified according to the predefined HERid naming system."
* identifier[HER].system 1..
* identifier[HER].system = "urn:oid:2.16.578.1.12.4.1.2" (exactly)
* identifier[HER].system ^short = "The official name of the HERid namespace"
* identifier[HER].value 1..
* identifier[HER].value ^short = "The actual HER-id from the Norwegian Adresseregister"
* identifier[HER].value ^definition = "The actual HER-id from the Norwegian Adresseregister"
* type ^slicing.discriminator.type = #value
* type ^slicing.discriminator.path = "coding.system"
* type ^slicing.rules = #open
* type 1..1
* type from OrganizationType (example)
* type ^alias[0] = "tjenestetype"
* type ^binding.extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName"
* type ^binding.extension.valueString = "OrganizationType"
* type ^binding.description = "Tjenestetype CodeSystems"
* type contains
    organisatoriskNiva 0..1 and
    organisatoriskBetegnelse 0..1
* type[organisatoriskNiva] ..1
* type[organisatoriskNiva] from urn:oid:2.16.578.1.12.4.1.1.8628 (required)
* type[organisatoriskNiva].coding.system 1..
* type[organisatoriskNiva].coding.system = "urn:oid:2.16.578.1.12.4.1.1.8628" (exactly)
* type[organisatoriskBetegnelse] ..1
* type[organisatoriskBetegnelse] from urn:oid:2.16.578.1.12.4.1.1.8624 (required)
* type[organisatoriskBetegnelse].coding.system 1..
* type[organisatoriskBetegnelse].coding.system = "urn:oid:2.16.578.1.12.4.1.1.8624" (exactly)
* partOf 1..
