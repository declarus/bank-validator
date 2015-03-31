require 'active_model'

class BicValidator < ActiveModel::EachValidator

  def validate_each(record, attribute, value)
    record_error(record, attribute, value) unless value =~ regexp
  end
  
  private
  
  def record_error(record, attribute, value)
    record.errors.add(attribute, (:invalid_bic || options[:message]))
  end

  def regexp
    /[A-Z]{6}[A-Z0-9]{2,}/
  end
end
