require 'json'

class EnergyMarket
  def initialize(plans)
    @plans = plans
  end

  # Returns an array of plans available in the market for a given consumption.
  #
  # [{"provider"=>"edf", "plan type"=>"fixed", "price"=>"205.75"},
  #  {"provider"=>"eon", "plan type"=>"variable", "price"=>"213.68"},
  #  {"provider"=>"bg", "plan type"=>"standing-charge", "price"=>"215.83"},
  #  {"provider"=>"ovo", "plan type"=>"standard", "price"=>"235.73"}]
  def price(consumption)
  end

  def usage(supplier_name, plan_type, monthly_spend)
    10
  end
end
