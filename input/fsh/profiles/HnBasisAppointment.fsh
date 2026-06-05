Profile: HnBasisAppointment
Parent: NoBasisAppointment
Id: hn-basis-appointment
Title: "hn-basis-appointment"
Description: "Base profile for Helsenorge Appointment information. Defined by Helsenorge based on national profile."
* ^version = "2.5.4"
* ^status = #draft
* obeys cancelationReason-inv and contained-location-must-have-managingorganization and hn-app-primary-2 and hn-app-primary-3 and hn-app-reqperiod-1 and hn-app-primary-4 and hn-app-primary-5 and serviceCategory-location-type and serviceCategory-7-location-requires-ptres-or-of and serviceCategory-7-location-not-both-ptres-and-of and serviceCategory-7-contained-flag-rules and contained-flag-allowed-codes and serviceCategory-7-no-varsling-or-paminnelse and supportinginformation-organization-partof and serviceCategory-7-requires-kommunikasjonspart-organization and virtualservice-or-location-required and hn-app-proposed-only-servicecategory-7
* meta ^short = "Metadata used for Appointment in Helsenorge"
* meta ^definition = "Appointment-specific use of generic Helsenorge FHIR metadata. See generic description of metadata mechanisms: <https://helsenorge.atlassian.net/wiki/spaces/HELSENORGE/pages/743014401/Meta+informasjon+som+kan+benyttes+for+alle+FHIR+ressurser>. This profile constrains selected metadata elements relevant for Appointment, including conditional access restriction, notification handling, and reminder handling."
* meta.lastUpdated 1.. MS
* meta.lastUpdated ^short = "Last updated timestamp for the resource"
* meta.lastUpdated ^definition = "If present, indicates when the resource was created or last changed."
* meta.lastUpdated ^comment = "This value is typically populated by the server/resource manager."
* meta.security ^slicing.discriminator.type = #value
* meta.security ^slicing.discriminator.path = "system"
* meta.security ^slicing.rules = #open
* meta.security contains tilgangsbegrensning 0..1 MS
* meta.security[tilgangsbegrensning] from HnBetingetTilgangsbegrensningVS (required)
* meta.security[tilgangsbegrensning] ^short = "Betinget tilgangsbegrensning metadata"
* meta.security[tilgangsbegrensning] ^definition = "Metadata for conditional access restriction for Appointment in Helsenorge."
* meta.security[tilgangsbegrensning].system 1..
* meta.security[tilgangsbegrensning].system = "urn:oid:2.16.578.1.12.4.1.1.9603" (exactly)
* meta.security[tilgangsbegrensning].code 1..
* meta.tag ^slicing.discriminator.type = #value
* meta.tag ^slicing.discriminator.path = "system"
* meta.tag ^slicing.rules = #open
* meta.tag contains
    varsling 0..* MS and
    paminnelse 0..1 MS
* meta.tag[varsling] from HnVarslingVS (required)
* meta.tag[varsling] ^short = "Varsling metadata"
* meta.tag[varsling] ^definition = "Metadata used to control notification behaviour for the Appointment in Helsenorge, including optional sender organization name."
* meta.tag[varsling].extension contains HnExtensionVarselorganisasjon named varselorganisasjon 0..1
* meta.tag[varsling].system 1..
* meta.tag[varsling].system = "http://helsenorge.no/fhir/varsling" (exactly)
* meta.tag[varsling].code 1..
* meta.tag[paminnelse] from HnPaminnelseVS (required)
* meta.tag[paminnelse] ^short = "Påminnelse metadata"
* meta.tag[paminnelse] ^definition = "Metadata used to control reminder behaviour for the Appointment in Helsenorge."
* meta.tag[paminnelse].system 1..
* meta.tag[paminnelse].system = "http://helsenorge.no/fhir/paminnelse" (exactly)
* meta.tag[paminnelse].code 1..
* implicitRules ..0
* language ..0
* text ..0
* extension[virtualService].extension[channelType] ^sliceName = "channelType"
* extension[virtualService].extension[channelType].value[x] from HnBasisVirtualServiceType (required)
* extension contains
    HnBasisRecurring named recurring 0..1 MS and
    HnBasisPostponementReason named postponementReason 0..1 and
    HnBasisConsultationType named consultationType 0..0 MS
* identifier 1..1
* identifier.system 1..
* identifier.value 1..
* identifier.assigner 1..
* identifier.assigner only Reference(Organization or NoBasisOrganization)
* status from $hn-appointment-status-vs (required)
* cancelationReason from HnCancellationReasonVS (required)
* cancelationReason ^short = "Reason for cancelation"
* cancelationReason ^definition = "Volven 8445 is a preferred code system but other code systems as Volven 9179 can also be used"
* cancelationReason.coding obeys inv-4
* serviceCategory 1..1
* serviceCategory from HnAppointmentServiceCategoryVS (required)
* serviceCategory.coding obeys inv-4
* serviceType ..0
* serviceType.coding obeys inv-4
* specialty ..0
* specialty.coding obeys inv-4
* appointmentType 1..
* appointmentType.coding obeys inv-4
* appointmentType.coding contains helsenorge 0..1 MS
* appointmentType.coding[helsenorge] from HnAppointmentAppointmentTypeVS (required)
* appointmentType.coding[helsenorge] ^short = "Codes from value set"
* appointmentType.coding[helsenorge] ^definition = "Codes from value set"
* reasonCode ..0
* reasonReference ..0
* priority ..0
* description obeys must-be-max-1000-chars
* supportingInformation ^slicing.discriminator.type = #type
* supportingInformation ^slicing.discriminator.path = "resolve()"
* supportingInformation ^slicing.rules = #open
* supportingInformation ^min = 0
* supportingInformation contains
    kommunikasjonspart 1..1 and
    documentReference 0..1 and
    flag 0..4
* supportingInformation[kommunikasjonspart] only Reference(Organization)
* supportingInformation[kommunikasjonspart] ^short = "Kommunikasjonspart"
* supportingInformation[kommunikasjonspart] ^definition = "Kommunikasjonspart organization used to transfer HER-id level 2 for the communication partner when serviceCategory is not 7. Else base organization is used tranfering both level 1 and level 2."
* supportingInformation[documentReference] only Reference(NoBasisDocumentReference)
* supportingInformation[documentReference] ^short = "Document reference"
* supportingInformation[documentReference] ^definition = "DocumentReference resource with supporting documentation for the appointment."
* supportingInformation[flag] only Reference(HnBasisFlag)
* supportingInformation[flag] ^short = "Flag"
* supportingInformation[flag] ^definition = "Flag resource with supporting flag information for the appointment."
* slot ..0
* comment ..0
* patientInstruction obeys must-be-max-1000-chars
* participant obeys appointment-participant-actor-patient-reference-identifier and appointment-participant-actor-patient-reference-reference
* participant.type.coding obeys inv-4
* participant.actor 1..
* participant.actor only Reference(NoBasisPatient or NoBasisPractitioner or NoBasisLocation or NoBasisPractitionerRole)
* participant.actor ^short = "When actor is a Patient logical reference MUST be used"
* participant.actor ^definition = "When actor is a Patient only logical reference MUST be used. In all other cases Logical, Literal reference, Relative, internal or absolute URL can be used"
* requestedPeriod ..1
