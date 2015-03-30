require 'rails_helper'

RSpec.describe 'testing the gem', type: :feature do
  before :each do
    @user = User.create(name: 'Adam', iban: '', bic: '')
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
