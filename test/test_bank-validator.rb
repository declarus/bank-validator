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
      return false unless valid?
    end

    def self.create(attributes = {})
      new(attributes).save
    end
  end

  should "not save if the iban is too short" do
    assert_equal TestUser.create(iban: "GB82WEST"), false
  end

  should "save if the iban is at least 16 characters" do
    assert_equal TestUser.create(iban: "GB82WEST12345698765432"), nilk
  end

  should "returns false if the iban does not leave a remainder of 1 when divided by 97" do
    assert_equal TestUser.create(iban: "GB82WEST123456987654Df"), false
  end

  should "returns true if the iban returns a remainder of 1 when divided by 97" do
    assert_equal TestUser.create(iban: "GB82WEST12345698765432"), nil
  end

  should "work for different IBAN formats" do
    #Belgium
    assert_equal TestUser.create(iban: "BE62510007547061"), nil

    #Bulgaria
    assert_equal TestUser.create(iban: "BG80BNBG96611020345678"), nil

    #Germany
    assert_equal TestUser.create(iban: "DE89370400440532013000"), nil
  end
end
