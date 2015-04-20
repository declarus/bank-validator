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
    d = route_number.each_char.to_a

    (weighted_value(1, d, [2, 5, 8]) + weighted_value(3, d, [0, 3, 6]) + weighted_value(7, d, [1, 4, 7])) % 10 == 0
  end

  def weighted_value(weight, array, indexes)
    weight * array.values_at(*indexes).collect! {|v| v.to_i}.inject(:+)
  end
end
