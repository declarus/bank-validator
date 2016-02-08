module BankValidator
  class Bic
    attr_accessor :value

    def initialize(bic)
      @value = bic
    end

    def valid?
      BankValidator::Bic.valid_format?(value)
    end

    def self.valid_format?(bic)
      bic =~ /[A-Z]{6,6}[A-Z2-9][A-NP-Z0-9]([A-Z0-9]{3,3}){0,1}/ ? true : false
    end
  end
end
