Invariant: hn-app-community-cancelation-reason
Description: "Cancelled appointments that are not service category 27 or 30 shall use a cancellation reason from code system 7621."
Severity: #error
Expression: "
(status = 'cancelled'
 and partOf.empty()
 and serviceCategory.coding.where(code = '27' or code = '30').empty())
implies
cancelationReason.coding.where(
  system = 'urn:oid:2.16.578.1.12.4.1.1.7621'
).exists()
"