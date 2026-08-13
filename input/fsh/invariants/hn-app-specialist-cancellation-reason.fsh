Invariant: hn-app-specialist-cancellation-reason
Description: "Service categories 27 and 30 shall use Norwegian cancellation reason codes"
* severity = #error
* expression =
  "serviceCategory.coding.where(code='27' or code='30').exists()
   implies
   cancellationReason.coding.where(
     system='urn:oid:2.16.578.1.12.4.1.1.8445'
     or
     system='urn:oid:2.16.578.1.12.4.1.1.9179'
   ).exists()"