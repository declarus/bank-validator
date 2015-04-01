require 'dummy_classes'
class TestBankValidator < MiniTest::Test

  context "test custom messages" do
    should "display custom iban error message" do
      user = DummyUser2.new(iban: "GB82WEST", bic: "DEUTDEBR", routing_number: "026009593")
      user.valid?
      assert_equal ['custom iban error message'], user.errors[:iban]
    end

    should "display custom bic error message" do
      user = DummyUser2.new(iban: "GB82WEST12345698765432", bic: "DEUTDE", routing_number: "026009593")
      user.valid?
      assert_equal ['custom bic error message'], user.errors[:bic]
    end

    should "display custom routing number error message" do
      user = DummyUser2.new(iban: "GB82WEST12345698765432", bic: "DEUTDEBR", routing_number: "02600959")
      user.valid?
      assert_equal ['custom routing number error message'], user.errors[:routing_number]
    end
  end

  context "iban validator" do
    should "not save if the iban is too short" do
      assert_equal false, DummyUser.create(iban: "GB82WEST", bic: "DEUTDEBR", routing_number: "026009593")
    end

    should "save if the iban is at least 16 characters" do
      assert_equal true, DummyUser.create(iban: "GB82WEST12345698765432", bic: "DEUTDEBR", routing_number: "026009593")
    end

    should "returns false if the iban does not leave a remainder of 1 when divided by 97" do
      assert_equal false, DummyUser.create(iban: "GB82WEST123456987654Df", bic: "DEUTDEBR", routing_number: "026009593")
    end

    should "returns true if the iban returns a remainder of 1 when divided by 97" do
      assert_equal true, DummyUser.create(iban: "GB82WEST12345698765432", bic: "DEUTDEBR", routing_number: "026009593")
    end

    should "work for different IBAN formats" do
      #Belgium
      assert_equal true, DummyUser.create(iban: "BE62510007547061", bic: "DEUTDEBR", routing_number: "026009593")

      #Bulgaria
      assert_equal true, DummyUser.create(iban: "BG80BNBG96611020345678", bic: "DEUTDEBR", routing_number: "026009593")

      #Germany
      assert_equal true, DummyUser.create(iban: "DE89370400440532013000", bic: "DEUTDEBR", routing_number: "026009593")
    end
  end

  context "bic validator" do
    should "be between 8 and 11 characters" do
      assert_equal true, DummyUser.create(bic: "DEUTDEBR", iban: "BE62510007547061", routing_number: "026009593")
      assert_equal true, DummyUser.create(bic: "DEUTDEBR123", iban: "BE62510007547061", routing_number: "026009593")
    end

    should "start with 6 letters" do
      assert_equal true, DummyUser.create(bic: "DEUTDEBR", iban: "BE62510007547061", routing_number: "026009593")
      assert_equal false, DummyUser.create(bic: "DEUT22BR", iban: "BE62510007547061", routing_number: "026009593")
    end
  end

  context "routing number" do
    should "be 9 digits long" do
      assert_equal true, DummyUser.create(bic: "DEUTDEBR", iban: "BE62510007547061", routing_number: "026009593")
    end

    should "return false if not 9 digits long" do
      assert_equal false, DummyUser.create(bic: "DEUTDEBR", iban: "BE62510007547061", routing_number: "02600959")
      assert_equal false, DummyUser.create(bic: "DEUTDEBR", iban: "BE62510007547061", routing_number: "0260095933")
    end
  end
end
