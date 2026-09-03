Invariant: kommunikasjonspart-parent-organization
Description: "When serviceCategory is not 27 or 30, the kommunikasjonspart Organization referenced from supportingInformation shall have a partOf reference to a parent no-basis-Organization containing both an organization number and a HER-id."
* severity = #error
* expression = "
serviceCategory.coding.code.where($this = '27' or $this = '30').exists()
or
supportingInformation.resolve().ofType(Organization)
.where(meta.profile.exists($this = 'http://helsenorge.no/fhir/StructureDefinition/kommunikasjonspart-Organization'))
.all(
  partOf.exists()
  and partOf.resolve().ofType(Organization).all(
    meta.profile.exists($this = 'http://hl7.no/fhir/StructureDefinition/no-basis-Organization')
    and identifier.where(system = 'urn:oid:2.16.578.1.12.4.1.4.101').exists()
    and identifier.where(system = 'urn:oid:2.16.578.1.12.4.1.2').exists()
  )
)
"