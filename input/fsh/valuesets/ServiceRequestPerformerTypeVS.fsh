ValueSet: ServiceRequestPerformerTypeVS
Id: serviceRequest-performerType-vs
Title: "ServiceRequest PerformerType Value Set"
Description: "Koder for valgte profesjonstyper."
* ^version = "1.3.2"
* ^status = #active
* ^experimental = true
* ^date = "2025-10-20T23:59:35+02:00"
* ^jurisdiction = urn:iso:std:iso:3166#NO "Norway"
* include codes from system SNOMED_CT where concept is-a #158965000
* include codes from system NoKodeverk9060