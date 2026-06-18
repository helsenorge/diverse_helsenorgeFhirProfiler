Invariant: hn-app-entered-in-error-requires-requestedperiod-if-no-start
Description: "If status is entered-in-error and start is not provided, requestedPeriod must be present so start and end can be derived."
* severity = #error
* expression = "status != 'entered-in-error' or start.exists() or requestedPeriod.exists()"