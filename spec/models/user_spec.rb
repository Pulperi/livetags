require 'rails_helper'

RSpec.describe User, type: :model do

  it 'has the username set correctly' do
    user = User.new username:'pekka'
    expect(user.username).to eq 'pekka'
  end

  it 'has the name set correctly' do
    user = User.new name:'Pekka'
    expect(user.name).to eq 'Pekka'
  end

  it 'is not saved without a password' do
    user = User.create name:'Pekka', username:'Pekka'
    expect(user).not_to be_valid
    expect(User.count).to eq 0
  end

  it 'is not saved without a username' do
    user = User.create password:'password', password_confirmation:'password'
    expect(user).not_to be_valid
    expect(User.count).to eq 0
  end

  describe 'is not saved when the password' do
    it 'is too short' do
      user = User.create username:'Pekka', password: 'Sx1', password_confirmation: 'Sx1'
      expect(user).not_to be_valid
      expect(User.count).to eq 0
    end

    it 'does not contain numbers' do
      user = User.create username:'Pekka', password: 'Secret', password_confirmation: 'Secret'
      expect(user).not_to be_valid
      expect(User.count).to eq 0
    end
  end

  describe 'with a proper password' do
    let(:user1){ FactoryGirl.create :user }
    let(:user2){ FactoryGirl.create :user, name:'Very Long Username', username:'pekka2'}

    it 'is saved' do
      expect(user1).to be_valid
      expect(user2).to be_valid
      expect(User.count).to eq(2)
    end

    it 'to string method shows full name for short user names' do
      expect(user1.to_s).to eq 'Pekka'
    end

    it 'to string method only displays max 15 characters' do
      expect(user2.name).to eq 'Very Long Username'
      expect(user2.to_s.length).to eq 15
    end
  end



end
