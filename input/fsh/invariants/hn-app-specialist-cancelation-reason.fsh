Invariant: hn-app-specialist-cancelation-reason
Description: "Service categories 27 and 30 shall use Norwegian cancellation reason codes"
* severity = #error
* expression =
  "(serviceCategory.coding.where(code='27' or code='30').exists()
  and status = 'cancelled'
  and partOf.empty())
   implies
   cancelationReason.coding.where(
     system='urn:oid:2.16.578.1.12.4.1.1.8445'
     or
     system='urn:oid:2.16.578.1.12.4.1.1.9179'
   ).exists()"