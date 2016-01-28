class IbanValidator < ActiveModel::EachValidator

  def validate_each(record, attribute, value)
    record_error(record, attribute, value) unless BankValidator::Iban.new(value).valid?
  end
  

  private
  
  def record_error(record, attribute, value)
    record.errors.add(attribute, (options[:message] || :invalid_iban))
  end
end
