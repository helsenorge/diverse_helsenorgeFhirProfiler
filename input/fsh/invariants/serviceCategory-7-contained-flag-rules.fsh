Invariant: serviceCategory-7-contained-flag-rules
Description: "When serviceCategory is 7, contained Flag resources must not use the codes canAcknowledge, canChangeAppointmentDialog, canHaveAppointmentDetails or canInitiateDialog or cancel or cancelWithComment."
* severity = #error
* expression = "serviceCategory.coding.where(code = '7').empty() or contained.ofType(Flag).all(code.coding.where(code in ('canAcknowledge' | 'canChangeAppointmentDialog' | 'canHaveAppointmentDetails' | 'canInitiateDialog' | 'cancel' | 'cancelWithComment')).empty())"
