Feature: Calculate annual usage in kWh from a monthly spend when discounts apply
    Scenario: Standard Plan
        Given plans with discounts 
        When supplier name is "ovo"
        And plan name is "standard"
        And monthly spend is 109.73 pounds
        Then annual usage is 1000 kWh
    
    Scenario: Fixed Plan
        Given plans with discounts
        When supplier name is "edf"
        And plan name is "fixed"
        And monthly spend is 100.75 pounds
        Then annual usage is 1000 kWh

     Scenario: Standing Charge
        Given plans with discounts
        When supplier name is "bg"
        And plan name is "standing-charge"
        And monthly spend is 116.08 pounds
        Then annual usage is 1000 kWh