class BicValidator < ActiveModel::EachValidator

  def validate_each(record, attribute, value)
    record_error(record, attribute, value) unless BankValidator::Bic.new(value).valid?
  end
  
  private
  
  def record_error(record, attribute, value)
    record.errors.add(attribute, (options[:message] || :invalid_bic))
  end
end
