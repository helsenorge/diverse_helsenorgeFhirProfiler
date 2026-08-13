Invariant: hn-app-primary-4
Description: "partOf is only allowed when serviceCategory is 27 or 30"
* severity = #error
* expression = "partOf.empty() or serviceCategory.coding.where(code = '27' or code = '30').exists()"