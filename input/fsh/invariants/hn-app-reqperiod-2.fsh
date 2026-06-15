Invariant: hn-app-reqperiod-2
Description: "If requestedPeriod is present, status must be proposed, cancelled, or entered-in-error."
* severity = #error
* expression = "requestedPeriod.empty() or (status = 'proposed' or status = 'cancelled' or status = 'entered-in-error')"