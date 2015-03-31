class User < ActiveRecord::Base
  validates :iban, iban: true
  validates :bic, bic: true
  validates :routing_number, routing_number: true
end
