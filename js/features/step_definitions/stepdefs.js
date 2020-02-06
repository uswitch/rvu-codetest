const assert = require('assert');
const { Given, When, Then } = require('cucumber');

var EnergyMarket = require('../../lib/energy_market');
var fs = require('fs');

var loadPlans = function(filepath) {
    var file = fs.readFileSync(filepath, "utf8");
    return JSON.parse(file);
}

Given('the plans provided', function () {
    this.market = new EnergyMarket(loadPlans("../plans.json"));
});

Given('plans with discounts', function () {
    this.market = new EnergyMarket(loadPlans("../plans-with-discounts.json"));
});

When('annual usage is {int} kwh', function (usage) {    
    this.plans = this.market.price(usage);
});

Then('the cheapest plans are', function (plans) {
    
    var plans = plans.hashes();
    
    assert.deepEqual(this.plans[0], plans[0]);
    assert.deepEqual(this.plans[1], plans[1]);
    assert.deepEqual(this.plans[2], plans[2]);
    assert.deepEqual(this.plans[3], plans[3]);
});

When('supplier name is {string}', function (supplierName) {
    this.supplierName = supplierName;
    
});

When('plan type is {string}', function (planType) {
    this.planType = planType;
});

When('monthly spend is {int} pounds', function (spend) {
    this.monthlySpend = spend;
});

Then('annual usage is {int} kWh', function (usage) {
    var actualUsage = this.market.usage(this.supplierName, this.planType, this.monthlySpend);
    
    assert.equal(actualUsage, usage);
});