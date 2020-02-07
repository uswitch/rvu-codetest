require 'json'

class EnergyMarket
  def initialize(plans)
    @plans = plans
  end

  # Returns an array of plans available in the market for a given consumption.
  #
  # [{"supplier"=>"edf", "plan name"=>"fixed", "price"=>"205.75"},
  #  {"supplier"=>"eon", "plan name"=>"variable", "price"=>"213.68"},
  #  {"supplier"=>"bg", "plan name"=>"standing-charge", "price"=>"215.83"},
  #  {"supplier"=>"ovo", "plan name"=>"standard", "price"=>"235.73"}]
  def price(consumption)
  end

  def usage(supplier_name, plan_name, monthly_spend)
    10
  end
end
