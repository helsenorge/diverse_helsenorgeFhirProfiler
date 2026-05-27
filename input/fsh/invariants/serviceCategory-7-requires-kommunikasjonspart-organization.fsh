Invariant: serviceCategory-7-requires-kommunikasjonspart-organization
Description: "When serviceCategory is 7, supportingInformation[kommunikasjonspart] must reference an Organization."
* severity = #error
* expression = "serviceCategory.coding.where(code = '7').empty() or supportingInformation.resolve().ofType(Organization).exists()"
