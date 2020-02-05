Feature: Calculate annual usage in kWh from a monthly spend when discounts apply
    Scenario: Standard Plan
        Given plans with discounts 
        When supplier name is "ovo"
        And plan type is "standard"
        And monthly spend is 109.73 pounds
        Then annual usage is 1000 kWh
    
    Scenario: Fixed Plan
        Given plans with discounts
        When supplier name is "edf"
        And plan type is "fixed"
        And monthly spend is 99.57 pounds
        Then annual usage is 1000 kWh

     Scenario: Standing Charge
        Given plans with discounts
        When supplier name is "bg"
        And plan type is "standing-charge"
        And monthly spend is 114.96 pounds
        Then annual usage is 1000 kWh