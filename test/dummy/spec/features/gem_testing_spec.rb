require 'rails_helper'

RSpec.describe 'testing the gem', type: :feature do

  context "validating iban" do
    before :each do
      @user = User.create(name: 'Adam', iban: '', bic: 'DEUTDEFF500', routing_number: '226073523')
    end

    it 'validates a users iban' do
      @user.iban = 'GB82WEST12345698765432'
      expect(@user.save).to be(true)
    end

    it 'returns false for an invalid iban' do
      @user.iban = 'YOLO'
      expect(@user.save).to be(false)
    end

    it 'validates a belgian users iban' do
      @user.iban = 'BE62510007547061'
      expect(@user.save).to be(true)
    end

    it 'creates a user with full iban' do
      user = User.create(name: 'Adam', iban: 'BE62510007547061')
      expect(user.iban).to eq('BE62510007547061')
    end
  end

  context "validating bic" do
    before :each do
      @user = User.create(name: 'Adam', iban: 'BE62510007547061', bic: '', routing_number: '226073523')
    end

    it 'validates a users bic' do
      @user.bic = 'DEUTDEBR'
      expect(@user.save).to be(true)
    end

    it 'returns false for an invalid bic' do
      @user.bic = 'YOLO'
      expect(@user.save).to be(false)

      @user.bic = 'D3UTDEBR'
      expect(@user.save).to be(false)

      @user.bic = 'COBADEFXXX'
      expect(@user.save).to be(false)
    end

    it 'validates a different bic types' do
      @user.bic = 'DEUTDEDBBER'
      expect(@user.save).to be(true)

      @user.bic = 'DEUTDEFF500'
      expect(@user.save).to be(true)
    end

    it 'saves the bic' do
      user = User.create(name: 'Adam', iban: 'BE62510007547061', bic: 'DEUTDEFF500', routing_number: '226073523')
      user.save
      expect(user.valid?).to be(true)
      expect(user.bic).to eq('DEUTDEFF500')
    end
  end

  context "validating routing number" do
    before :each do
      @user = User.create(name: 'Adam', iban: 'BE62510007547061', bic: 'DEUTDEFF500', routing_number: '')
    end

    it 'validates a users routing number' do
      @user.routing_number = '226073523'
      expect(@user.save).to be(true)
    end

    it 'returns false for an invalid routing number' do
      @user.routing_number = '22607352'
      expect(@user.save).to be(false)

      @user.routing_number = '2260735233'
      expect(@user.save).to be(false)

      @user.routing_number = '2260-7352-3'
      expect(@user.save).to be(false)
    end
  end
end
