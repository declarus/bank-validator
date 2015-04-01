require 'active_model'

class RoutingNumberValidator < ActiveModel::EachValidator

  def validate_each(record, attribute, value)
    record_error(record, attribute, value) unless value =~ RoutingNumberValidator.regexp && valid_routing_number?(value)
  end
  
  private
  
  def record_error(record, attribute, value)
    record.errors.add(attribute, (options[:message] || :invalid_routing_number))
  end
  
  def self.regexp
    /^[0-9]{9}$/
  end

  def valid_routing_number?(route_number)
    d = route_number.chars

    ((3 * (d[0].to_i + d[3].to_i + d[6].to_i)) + (7 * (d[1].to_i + d[4].to_i + d[7].to_i)) + (d[2].to_i + d[5].to_i + d[8].to_i)) % 10 == 0
  end
end
