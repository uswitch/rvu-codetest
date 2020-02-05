Feature: Calculate annual usage in kWh from a monthly spend when discounts apply
    Scenario: Standard Plan
        Given plans with discounts 
        When supplier name is "ovo"
        And plan type is "standard"
        And monthly spend is 1000 pounds
        Then annual usage is 0 kWh
    
    Scenario: Fixed Plan
        Given plans with discounts
        When supplier name is "edf"
        And plan type is "fixed"
        And monthly spend is 350 pounds
        Then annual usage is 0 kWh

     Scenario: Standing Charge
        Given plans with discounts
        When supplier name is "bg"
        And plan type is "standing-charge"
        And monthly spend is 120 pounds
        Then annual usage is 0 kWh