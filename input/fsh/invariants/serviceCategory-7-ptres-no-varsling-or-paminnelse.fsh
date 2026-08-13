Invariant: serviceCategory-7-ptres-no-varsling-or-paminnelse
Description: "When serviceCategory is 7 and a contained Location has type PTRES, meta.tag varsling and paminnelse must not be used."
* severity = #error
* expression = "serviceCategory.coding.where(code = '7').empty() or contained.ofType(Location).where(type.coding.where(system = 'http://terminology.hl7.org/CodeSystem/v3-RoleCode' and code = 'PTRES').exists()).empty() or meta.tag.where(system = 'http://helsenorge.no/fhir/varsling' or system = 'http://helsenorge.no/fhir/paminnelse').empty()"