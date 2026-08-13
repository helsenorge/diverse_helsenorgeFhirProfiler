Invariant: community-services-requires-kommunikasjonspart-organization
Description: "For all serviceCategory values except 27 and 30, supportingInformation[kommunikasjonspart] must reference an Organization using a HER-id level 2 identifier system."
* severity = #error
* expression = "serviceCategory.coding.where(code = '27' or code = '30').exists() or supportingInformation.resolve().ofType(Organization).where(identifier.where(system = 'urn:oid:2.16.578.1.12.4.1.4.102').exists()).exists()"