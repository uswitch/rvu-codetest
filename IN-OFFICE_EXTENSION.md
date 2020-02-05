# Uswitch Extension Exercise

So far you have priced a collection of plans given a kWh consumption, and also calculated usage given a customer's annual spend.

In this extension exercise, we will be working with discounts.

# New Data

http://bit.do/rvu-extension-data

The new plans dataset contains an additional attribute; `discounts`.

# Types of discount

A plan can have any combination of three types of discounts, or it can have no discounts at all.

A discount looks as follows:

```json
{
        "applies_to": "whole_bill",
        "value": 5043,
        "value_type": "price"
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
+ We don't expect you to implement all types of discounts. Discounts are listed above in order of difficulty

# Interviewer notes 

+ The extension feature has been tagged "@wip". You can run only this feature using: cucumber --tags @wip
