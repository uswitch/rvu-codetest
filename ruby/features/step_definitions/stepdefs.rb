require File.expand_path("lib/energy_market")

def load_plans(filepath)
    file = File.open(File.expand_path(filepath))
    data = JSON.load(file.read)
end

Given("the plans provided") do
    @market = EnergyMarket.new(load_plans("../plans.json"))
end

Given("plans with discounts") do
    @market = EnergyMarket.new(load_plans("../plans-with-discounts.json"))
end

When("annual usage is {int} kwh") do |usage|
    @prices = @market.price(usage)
end

Then("the cheapest plans are") do |table|
    table_hash = table.hashes
    
    expect(@prices[0]).to eq(table_hash[0])
    expect(@prices[1]).to eq(table_hash[1])
    expect(@prices[2]).to eq(table_hash[2])
    expect(@prices[3]).to eq(table_hash[3])
end

When("supplier name is {string}") do |string|
    @supplier_name = string
end
  
When("plan name is {string}") do |string|
    @plan_name = string
end
  
When("monthly spend is {int} pounds") do |int|
    @monthly_spend = int
end

When("monthly spend is {float} pounds") do |float|
    @monthly_spend = float
end
  
Then("annual usage is {int} kWh") do |int|
    usage = @market.usage(@supplier_name, @plan_name, @monthly_spend)
    expect(usage).to eq(int)
end
