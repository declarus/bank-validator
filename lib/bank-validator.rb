require_relative './active_model/iban_validator'
require_relative './active_model/bic_validator'

module ActiveModel
  autoload :IbanValidator, './active_model/iban_validator'
  autoload :BicValidator, './active_model/bic_validator'
end
