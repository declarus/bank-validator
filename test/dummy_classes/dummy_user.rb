class DummyUser
  include ActiveModel::Validations
  validates :iban, iban: true
  validates :bic, bic: true
  validates :routing_number, routing_number: true

  attr_accessor :iban

  def initialize(attributes = {})
    @iban = attributes[:iban]
    @bic = attributes[:bic]
    @routing_number = attributes[:routing_number]
  end

  def save
    if valid?
      return true
    else
      return false
    end
  end

  def self.create(attributes = {})
    new(attributes).save
  end

  def iban
    @iban
  end

  def bic
    @bic
  end

  def routing_number
    @routing_number
  end
end
