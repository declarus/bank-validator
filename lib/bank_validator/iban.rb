module BankValidator
  class Iban
    attr_accessor :value

    def initialize(iban)
      @value = iban
    end

    def valid?
      BankValidator::Iban.valid_format?(value) && BankValidator::Iban.valid_checksum?(value)
    end

    class << self
      def valid_format?(iban)
        iban =~ /[A-Z]{2}[a-zA-Z0-9]{14,}/ ? true : false
      end

      def valid_checksum?(iban)
        # Move first four characters to end of string
        dummy_iban = iban[4..-1] + iban[0..3]

        # Substitute all letters with integers
        checksum = dummy_iban.chars.map { |char| ((char =~ /[a-zA-Z]/).present?) ? (char.downcase.ord - 87).to_s : char }.join

        # Check if division by 97 yields a remainder of 1, in which case it could be a valid IBAN
        (checksum.to_i % 97) == 1
      end
    end
  end
end
