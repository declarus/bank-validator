require 'helper'

class TestBankValidator < MiniTest::Test

  class TestUser
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

  context "iban validator" do
    should "not save if the iban is too short" do
      assert_equal false, TestUser.create(iban: "GB82WEST", bic: "DEUTDEBR", routing_number: "026009593")
    end

    should "save if the iban is at least 16 characters" do
      assert_equal true, TestUser.create(iban: "GB82WEST12345698765432", bic: "DEUTDEBR", routing_number: "026009593")
    end

    should "returns false if the iban does not leave a remainder of 1 when divided by 97" do
      assert_equal false, TestUser.create(iban: "GB82WEST123456987654Df", bic: "DEUTDEBR", routing_number: "026009593")
    end

    should "returns true if the iban returns a remainder of 1 when divided by 97" do
      assert_equal true, TestUser.create(iban: "GB82WEST12345698765432", bic: "DEUTDEBR", routing_number: "026009593")
    end

    should "work for different IBAN formats" do
      #Belgium
      assert_equal true, TestUser.create(iban: "BE62510007547061", bic: "DEUTDEBR", routing_number: "026009593")

      #Bulgaria
      assert_equal true, TestUser.create(iban: "BG80BNBG96611020345678", bic: "DEUTDEBR", routing_number: "026009593")

      #Germany
      assert_equal true, TestUser.create(iban: "DE89370400440532013000", bic: "DEUTDEBR", routing_number: "026009593")
    end
  end

  context "bic validator" do
    should "be between 8 and 11 characters" do
      assert_equal true, TestUser.create(bic: "DEUTDEBR", iban: "BE62510007547061", routing_number: "026009593")
      assert_equal true, TestUser.create(bic: "DEUTDEBR123", iban: "BE62510007547061", routing_number: "026009593")
    end

    should "start with 6 letters" do
      assert_equal true, TestUser.create(bic: "DEUTDEBR", iban: "BE62510007547061", routing_number: "026009593")
      assert_equal false, TestUser.create(bic: "DEUT22BR", iban: "BE62510007547061", routing_number: "026009593")
    end
  end

  context "routing number" do
    should "be 9 digits long" do
      assert_equal true, TestUser.create(bic: "DEUTDEBR", iban: "BE62510007547061", routing_number: "026009593")
    end

    should "return false if not 9 digits long" do
      assert_equal false, TestUser.create(bic: "DEUTDEBR", iban: "BE62510007547061", routing_number: "02600959")
      assert_equal false, TestUser.create(bic: "DEUTDEBR", iban: "BE62510007547061", routing_number: "0260095933")
    end
  end
end
