module AddressesHelper
  def country_options
    COUNTRIES.keys
  end

  def province_options
    PROVINCES.map { |p| p.second[:name] }
  end

  def state_options
    STATES.map { |s| s.second[:name] }
  end
end
