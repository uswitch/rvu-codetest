# Uswitch Extension Exercise

So far, you have priced a collection of plans given a kWh consumption,
and also calculated usage given a customer's annual spend.

In this extension exercise, we will be adding a new feature to the
program that will apply discounts to your calculation.

# New Data

We have provided a new set of `plans`, `inputs` and `expected_output`.

This new data contains the additional attribute; `discounts`.

You should download these files from

http://bit.do/rvu-extension-plan-data

# Types of discount

A plan can now include a discount, or it can have no discount at all.

Discounts are applied to the whole bill, and looks like the following:

```json
[
    {
        "applies_to": "whole_bill",
        "amount_in_pence": 500
    }
]
```

+ `applies_to` refers to the type of discount being described.

    In this case, `whole_bill` which are lump monetary amounts taken off the bill, in pence.

+ `amount_in_pence` is the integer amount to be discounted from the bill


Your task is to update your program to apply the discount, first for the `price`, and then for the `usage` commands.

# Notes

+ All discounts should be removed **before** VAT is applied
+ Discounts are in an **Array**
+ There can be either, **zero** or **one** discounts in the array

# Testing your changes

To help check the output of your program, we have provided some **Feature files**.

These are natural language descriptions of what your program should do, given certain parameters.

You can download fe

# Running the Automated Scenarios

In the interview you may find it useful to run individual features using tags (see example above).

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

```
{coding-test-dir}/js/node_modules/cucumber/bin/cucumber-js --tags @wip

```
