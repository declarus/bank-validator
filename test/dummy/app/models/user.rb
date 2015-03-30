class User < ActiveRecord::Base
  validates :iban, iban: true
  validates :bic, bic: true
end
