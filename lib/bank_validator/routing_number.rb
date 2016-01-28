module BankValidator
  class RoutingNumber
    attr_accessor :value

    def initialize(routing_number)
      @value = routing_number
    end

    def valid?
      BankValidator::RoutingNumber.valid_format?(value) && BankValidator::RoutingNumber.valid_routing_number?(value)
    end

    class << self
      def valid_routing_number?(routing_number)
        d = routing_number.each_char.to_a

        (BankValidator::RoutingNumber.weighted_value(1, d, [2, 5, 8]) + BankValidator::RoutingNumber.weighted_value(3, d, [0, 3, 6]) + BankValidator::RoutingNumber.weighted_value(7, d, [1, 4, 7])) % 10 == 0
      end

      def valid_format?(routing_number)
        routing_number =~ /^[0-9]{9}$/ ? true : false
      end

      def weighted_value(weight, array, indexes)
        weight * array.values_at(*indexes).collect! {|v| v.to_i}.inject(:+)
      end
    end

  end
end
