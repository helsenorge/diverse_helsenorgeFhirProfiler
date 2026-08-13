Invariant: hn-app-primary-5
Description: "postponementReason is only allowed when serviceCategory is 27 or 30"
* severity = #error
* expression = "postponementReason.empty() or serviceCategory.coding.where(code = '27' or code = '30').exists()"