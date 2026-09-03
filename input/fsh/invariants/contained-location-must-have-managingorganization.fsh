Invariant: contained-location-must-have-managingorganization
Description: "When serviceCategory is 27 or 30, every contained Location must have managingOrganization."
* severity = #error
* expression = "serviceCategory.coding.where(code = '27' or code = '30').empty() or contained.ofType(Location).all(managingOrganization.exists())"
