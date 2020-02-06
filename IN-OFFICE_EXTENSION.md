# Uswitch Extension Exercise

So far you have priced a collection of plans given a kWh consumption, and also calculated usage given a customer's annual spend.

In this extension exercise, we will be working with discounts.

# New Data

http://bit.do/rvu-extension-plan-data

The new plans dataset contains an additional attribute; `discounts`.

# Types of discount

A plan can have a discount applied to the whole bill.

A discount looks as follows:

```json
{
    "applies_to": "whole_bill",
    "amount_in_pence": 500
}
```

+ `applies_to` refers to the type of discount being described. It can take the following values: `whole_bill`.
    + `whole_bill` discounts are lump monetary amounts in pence taken off the bill.
    
+ `value` refers to the amount either in pence or as a percentage that the specified aspect of the plan should be discounted by.
+ `value_type` refers to the type of discount being applied, either `price` or `percentage`.

Your task is to change your program to apply the discounts listed in the new plans collection.

# Notes

+ All discounts should be removed before VAT is applied
+ Discounts should be applied both when calculating a price from a consumption amount and when calculating a consumption amount from a price


# Features

## Pricing plans with discounts

```
@wip
Feature: Price plans that have a discount based on usage 
    Energy switchers want to see the cheapest energy tarrifs based on their usage

    Scenario: Find the cheapest energy plans when usage low
        Given plans with discounts
        When annual usage is 1000 kwh
        Then the cheapest plans are
        | provider | plan type          | price  |
        | edf      | fixed              | 100.75 |
        | eon      | variable           | 103.43 |
        | ovo      | standard           | 109.73 |
        | bg       | standing-charge    | 116.08 |

    Scenario: Find the cheapest energy plans when usage high
        Given plans with discounts 
        When annual usage is 2000 kwh
        Then the cheapest plans are
        | provider | plan type          | price  |
        | edf      | fixed              | 195.25 |
        | eon      | variable           | 208.43 |
        | bg       | standing-charge    | 210.58 |
        | ovo      | standard           | 225.23 |

```

### Calculating usage from a Monthly Spend when discounts apply 

```
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
        And monthly spend is 100.75 pounds
        Then annual usage is 1000 kWh

     Scenario: Standing Charge
        Given plans with discounts
        When supplier name is "bg"
        And plan type is "standing-charge"
        And monthly spend is 116.08 pounds
        Then annual usage is 1000 kWh
```

# Running the Automated Scenarios 

## Ruby 

```
cd {coding-test-dir}/ruby
bundle
cucumber

```

You can run an individual scenario using tags

```
cucumber --tags @wip
```

## JS 

```
cd {coding-test-dir}/js
npm install
npm test

```

You can run an individual scenario using tags

```
{coding-test-dir}/js/node_modules/cucumber/bin/cucumber-js --tags @wip

```