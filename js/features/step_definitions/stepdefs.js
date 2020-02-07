const fs = require('fs')
const assert = require('assert')

const { Given, When, Then } = require('cucumber')
const { price, usage } = require('../../lib/energy-market')

const loadPlans = function(filepath) {
  const json = fs.readFileSync(filepath, "utf8");
  return JSON.parse(json);
}

Given('the plans provided', function () {
  this.plans = loadPlans('../plans.json')
})

Given('plans with discounts', function () {
  this.plans = loadPlans('../plans-with-discounts.json')
})

/* Price */
When('annual usage is {int} kwh', function (usage) {
  this.usage = usage
})

Then('the cheapest plans are', function (plans) {
  const actual = price(this.plans, this.usage)
  const expected = plans.hashes()

  assert.deepStrictEqual(actual[0], expected[0])
  assert.deepStrictEqual(actual[1], expected[1])
  assert.deepStrictEqual(actual[2], expected[2])
  assert.deepStrictEqual(actual[3], expected[3])
})

/* Usage */
When('supplier name is {string}', function (supplierName) {
  this.supplierName = supplierName
})

When('plan name is {string}', function (planName) {
  this.planName = planName
})

When('monthly spend is {float} pounds', function (spend) {
  this.monthlySpend = spend
})

Then('annual usage is {int} kWh', function (expectedUsage) {
  const actualUsage = usage(
    this.plans,
    this.supplierName,
    this.planName,
    this.monthlySpend
  )

  assert.strictEqual(actualUsage, expectedUsage)
})
