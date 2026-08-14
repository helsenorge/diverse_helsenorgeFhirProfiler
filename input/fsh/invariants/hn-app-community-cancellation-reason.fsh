Invariant: hn-app-community-cancellation-reason
Description: "Cancelled appointments that are not service category 27 or 30 shall use pat, prov or other as cancellation reason."
Severity: #error
Expression: "
(status = 'cancelled'
 and partOf.empty()
 and serviceCategory.coding.where(code = '27' or code = '30').empty())
implies
cancelationReason.coding.where(
  system = 'http://terminology.hl7.org/CodeSystem/appointment-cancellation-reason'
  and (
    code = 'pat'
    or code = 'prov'
    or code = 'other'
  )
).exists()
"