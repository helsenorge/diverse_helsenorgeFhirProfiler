Invariant: hn-app-entered-in-error-requires-start-and-end
Description: "When status is entered-in-error, start and end SHALL be populated. If explicit start and end are not available, they SHALL be derived from requestedPeriod before submission."
* severity = #error
* expression = "status != 'entered-in-error' or (start.exists() and end.exists())"