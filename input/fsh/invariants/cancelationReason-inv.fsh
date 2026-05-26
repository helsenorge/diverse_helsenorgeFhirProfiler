Invariant: cancelationReason-inv
Description: "Cancelation reason MUST be set when status=cancelled and the appointment is not partOf another appointment"
* severity = #error
* expression = "(status = 'cancelled' and partOf.empty()) implies cancelationReason.exists()"
