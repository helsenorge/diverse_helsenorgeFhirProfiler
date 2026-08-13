Invariant: hn-app-community-cancellation-reason
Description: "Appointments that are not service category 27 or 30 shall use pat, prov or other as cancellation reason"

* severity = #error
* expression = "
serviceCategory.coding.where(code = '27' or code = '30').empty()
implies
cancellationReason.coding.where(
  system = 'http://terminology.hl7.org/CodeSystem/appointment-cancellation-reason'
  and (code = 'pat' or code = 'prov' or code = 'other')
).exists()
"