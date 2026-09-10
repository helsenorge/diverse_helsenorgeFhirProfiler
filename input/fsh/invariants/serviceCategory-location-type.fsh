Invariant: serviceCategory-location-type
Description: "For serviceCategory 27 or 30, every contained Location must have type HU or HOSP, and at least one HU and one HOSP Location must be present. The rule does not apply when Appointment.partOf is populated."
* severity = #error
* expression = "
partOf.exists() or
serviceCategory.coding.where(code = '27' or code = '30').empty() or
(
  contained.ofType(Location).where(
    type.coding.where(
      system = 'http://terminology.hl7.org/CodeSystem/v3-RoleCode' and
      code = 'HU'
    ).exists()
  ).exists()
  and
  contained.ofType(Location).where(
    type.coding.where(
      system = 'http://terminology.hl7.org/CodeSystem/v3-RoleCode' and
      code = 'HOSP'
    ).exists()
  ).exists()
)
"