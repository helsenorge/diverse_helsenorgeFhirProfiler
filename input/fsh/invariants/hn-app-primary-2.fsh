Invariant: hn-app-primary-2
Description: "If basedOn is present, serviceCategory must be 27 or 30"
* severity = #error
* expression = "basedOn.empty() or serviceCategory.coding.code.where($this = '27' or $this = '30').exists()"