require 'active_model'
require 'helper'

class TestBankValidator < MiniTest::Test

  class TestUser
    include ActiveModel::Validations
    validates :iban, iban: true

    attr_accessor :iban

    def initialize(attributes = {})
      @iban = attributes[:iban]
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
  end

  should "not save if the iban is too short" do
    assert_equal false, TestUser.create(iban: "GB82WEST")
  end

  should "save if the iban is at least 16 characters" do
    assert_equal true, TestUser.create(iban: "GB82WEST12345698765432")
  end

  should "returns false if the iban does not leave a remainder of 1 when divided by 97" do
    assert_equal false, TestUser.create(iban: "GB82WEST123456987654Df")
  end

  should "returns true if the iban returns a remainder of 1 when divided by 97" do
    assert_equal true, TestUser.create(iban: "GB82WEST12345698765432")
  end

  should "work for different IBAN formats" do
    #Belgium
    assert_equal true, TestUser.create(iban: "BE62510007547061")

    #Bulgaria
    assert_equal true, TestUser.create(iban: "BG80BNBG96611020345678")

    #Germany
    assert_equal true, TestUser.create(iban: "DE89370400440532013000")
  end
end
