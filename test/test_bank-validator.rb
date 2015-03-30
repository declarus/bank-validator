require 'helper'

class TestBankValidator < MiniTest::Test

  class TestUser
    include ActiveModel::Validations
    validates :iban, iban: true
    validates :bic, bic: true

    attr_accessor :iban

    def initialize(attributes = {})
      @iban = attributes[:iban]
      @bic = attributes[:bic]
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
  end

  context "iban validator" do
    should "not save if the iban is too short" do
      assert_equal false, TestUser.create(iban: "GB82WEST", bic: "DEUTDEBR")
    end

    should "save if the iban is at least 16 characters" do
      assert_equal true, TestUser.create(iban: "GB82WEST12345698765432", bic: "DEUTDEBR")
    end

    should "returns false if the iban does not leave a remainder of 1 when divided by 97" do
      assert_equal false, TestUser.create(iban: "GB82WEST123456987654Df", bic: "DEUTDEBR")
    end

    should "returns true if the iban returns a remainder of 1 when divided by 97" do
      assert_equal true, TestUser.create(iban: "GB82WEST12345698765432", bic: "DEUTDEBR")
    end

    should "work for different IBAN formats" do
      #Belgium
      assert_equal true, TestUser.create(iban: "BE62510007547061", bic: "DEUTDEBR")

      #Bulgaria
      assert_equal true, TestUser.create(iban: "BG80BNBG96611020345678", bic: "DEUTDEBR")

      #Germany
      assert_equal true, TestUser.create(iban: "DE89370400440532013000", bic: "DEUTDEBR")
    end
  end

  context "bic validator" do
    should "be between 8 and 11 characters" do
      assert_equal true, TestUser.create(bic: "DEUTDEBR", iban: "BE62510007547061")
      assert_equal true, TestUser.create(bic: "DEUTDEBR123", iban: "BE62510007547061")
    end

    should "start with 6 letters" do
      assert_equal true, TestUser.create(bic: "DEUTDEBR", iban: "BE62510007547061")
      assert_equal false, TestUser.create(bic: "DEUT22BR", iban: "BE62510007547061")
    end

  end
end
