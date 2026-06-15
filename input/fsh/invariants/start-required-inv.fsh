Invariant: start-required-inv
Description: "start is required unless the appointment uses requestedPeriod and status is proposed, cancelled, or entered-in-error."
* severity = #error
* expression = "start.exists() or (requestedPeriod.exists() and (status = 'proposed' or status = 'cancelled' or status = 'entered-in-error'))"