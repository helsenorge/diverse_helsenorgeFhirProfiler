Invariant: hn-app-availability-status
Description: "Proposed appointments with serviceCategory 7 shall have availabilityStatus. All other appointments shall not have availabilityStatus."
* severity = #error
* expression = "
(
  status = 'proposed' and
  serviceCategory.coding.code = '7'
)
=
extension('http://helsenorge.no/fhir/StructureDefinition/hn-availability-status').exists()
"