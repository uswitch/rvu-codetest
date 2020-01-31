Feature: Calculate annual usage in kWh from a monthly spend
    Scenario: Standard Plan
        Given the plans provided
        When supplier name is "ovo"
        And plan type is "standard"
        And monthly spend is 1000 pounds
        Then annual usage is 44267 kWh
    
    Scenario: Fixed Plan
        Given the plans provided
        When supplier name is "edf"
        And plan type is "fixed"
        And monthly spend is 350 pounds
        Then annual usage is 103855 kWh

     Scenario: Standing Charge
        Given the plans provided
        When supplier name is "bg"
        And plan type is "standing-charge"
        And monthly spend is 120 pounds
        Then annual usage is 14954 kWh