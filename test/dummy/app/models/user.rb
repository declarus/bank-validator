class User < ActiveRecord::Base
  validates :iban, iban: true
end
