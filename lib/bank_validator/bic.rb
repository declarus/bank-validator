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
      bic =~ /[A-Z]{6}[A-Z0-9]{2,}/ ? true : false
    end
  end
end
