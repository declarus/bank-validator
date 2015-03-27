require 'active_model'
module ActiveModel
  module Validations
    class IbanValidator < EachValidator

      def validate_each(record, attribute, value)
        record_error(record, attribute, value) unless value =~ regexp && valid_iban?(value)
      end
      
      private
      
      def record_error(record, attribute, value)
        record.errors.add(attribute, :invalid_iban, options.merge!(value: value))
      end
      
      def regexp
        /[A-Z]{2}[a-zA-Z0-9]{14,}/
      end
  
      def valid_iban?(iban)
        # Move first four characters to end of string
        first_four_chars = iban.slice!(0..3)
        iban += first_four_chars

        # Substitute all letters with integers
        iban.split(//).each { |char| iban.gsub!(char, char.downcase.ord - 87) if (char =~ /[a-zA-Z]/).present? }

        # Check if division by 97 yields a remainder of 1, in which case it could be a valid IBAN
        (iban.to_i % 97) == 1
      end
  
    end
  end
end
