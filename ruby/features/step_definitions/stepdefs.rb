require File.expand_path("lib/energy_market")

def load_plans()
    file = File.open(File.expand_path("../plans.json"))
    data = JSON.load(file.read)
end

Given("the plans provided") do
    @market = EnergyMarket.new(load_plans)
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
  
When("plan type is {string}") do |string|
    @plan_type = string
end
  
When("monthly spend is {int} pounds") do |int|
    @monthly_spend = int
end
  
Then("annual usage is {int} kWh") do |int|
    usage = @market.usage(@supplier_name, @plan_type, @monthly_spend)
    expect(usage).to eq(int)
end
