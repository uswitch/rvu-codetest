# Uswitch Energy Comparison

Choosing an energy supplier is a difficult job. There are many suppliers with
different plans and prices that vary by how much energy a customer consumes.

Your task is to help make the customer's decision easier by writing a program that:

* Prices plans on the market according to how much energy is used
* Calculates how much energy is used according to how much a customer spends each month on a specific plan

We provide automated acceptance scenarios for the expected program behaviour, available for Ruby and JavaScript. Please choose the language you feel most comfortable with.

This document outlines how to execute the scenarios in order to verify correct solution behaviour. You may find it helpful to write additional unit tests. We also includes a little background information on the problem domain.


### Plans

We provide some example energy market data in `plans.json`: snippet below

```json
[
  {
    "supplier":        "sse",
    "plan":            "standard",
    "rates":           [
      {"price": 13.5, "threshold": 150},
      {"price": 11.1, "threshold": 100},
      {"price": 10}
    ],
    "standing_charge": 9
  }
  ...
]
```

Plans contain rates that describe how much the customer will be charged for each kilowatt-hour (kWh) of energy that they use. Additionally, plans may also include a daily standing charge.

Plans can have multiple rates with the last rate always having no threshold. 
Thresholds indicate the quantity of energy (up to and including) that may be consumed at that price during the course of the year. Rates without a threshold have no limit.

In the example above, the first 150kWh will be charged at 13.5p/kWh, the next 100kWh
will be charged at 11.1p/kWh and all subsequent consumption will be charged at 10p/kWh.

Note that:

* Prices are stated in pence and are _exclusive_ of VAT.
* Standing charge is a daily charge stated in pence exclusive of VAT and is applied regardless of consumption.
* VAT for Energy is rated at 5%.

### Feature Scenarios

We have outlined the intended behaviour for both pricing plans according to energy usage and calculating how much energy is consumed based on monthly spend. 

```
Feature: Price plans based on usage
    Energy switchers want to see the cheapest energy tarrifs based on their usage

    Scenario: Find the cheapest energy plans when usage low
        Given the plans provided
        When annual usage is 1000 kwh
        Then the cheapest plans are
        | provider | plan type          | price  |
        | eon      | variable           | 108.68 |
        | edf      | fixed              | 111.25 |
        | ovo      | standard           | 120.23 |
        | bg       | standing-charge    | 121.33 |

    Scenario: Find the cheapest energy plans when usage high
        Given the plans provided
        When annual usage is 2000 kwh
        Then the cheapest plans are
        | provider | plan type          | price  |
        | edf      | fixed              | 205.75 |
        | eon      | variable           | 213.68 |
        | bg       | standing-charge    | 215.83 |
        | ovo      | standard           | 235.73 |


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
```

## Running the automated scenarios

You can verify that your solution provides the correct behaviour by executing the automated scenarios 

### Ruby

You will require [bundler](https://bundler.io)

You can test your installation with: bundle -v 

Execute the scenarios 

```
cd {coding-test-dir}/ruby
bundle
cucumber

```

### JS

You will require a working node and npm installation. Verify that Node.js is installed properly:

```
node -v
npm -v

```

Execute the scenarios 

```
cd {coding-test-dir}/js
npm install
npm test

```

## Your solution

### Submitting

Your code should be submitted in a tarball or zip that contains your full project and emailed to our recruiting team.

We will verify your solution passess the automated scenarios provided.

### Tips

Please write your solution in a language you feel confident in. Your program must pass the automated scenarios provided and be well written.

During the in-office interviews we will pair with you to extend the problem (and your program). It
may be worth re-reading your code before you come in if you've not looked at it for a while.

Please take your time to solve the problem fully, we appreciate people have day jobs and other
commitments. It shouldn't take more than a few hours but please let us know if you need to spread
that time over a few weeks.

Please do not publish your solution, for example on your blog or source control site.
