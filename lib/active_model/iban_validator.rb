require 'active_model'

class IbanValidator < ActiveModel::EachValidator

  def validate_each(record, attribute, value)
    record_error(record, attribute, value) unless value =~ regexp && valid_iban?(value)
  end
  
  private
  
  def record_error(record, attribute, value)
    record.errors.add(attribute, (options[:message] || :invalid_iban))# || options[:message]))
  end
  
  def regexp
    /[A-Z]{2}[a-zA-Z0-9]{14,}/
  end

  def valid_iban?(iban)
    # Move first four characters to end of string
    dummy_iban = iban.slice(4..-1) + iban.slice(0..3)

    # Substitute all letters with integers
    dummy_iban.split(//).each { |char| dummy_iban.gsub!(char, (char.downcase.ord - 87).to_s) if (char =~ /[a-zA-Z]/).present? }

    # Check if division by 97 yields a remainder of 1, in which case it could be a valid IBAN
    (dummy_iban.to_i % 97) == 1
  end
end
