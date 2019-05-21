require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do

  it "is valid with a password" do
    user = User.new(
      password: 'password',
      password_confirmation: 'password',
      email: 'maria@gmail.com',
      name: 'diana'
    )

    expect(user).to be_valid

  end

  it "is not valid without a password" do
    user = User.new(
      password: nil,
      password_confirmation: nil
    )

    expect(user).to_not be_valid
    expect(user.errors.full_messages).to include("Password can't be blank")

  end

  it "is not valid without a matching password" do
    user = User.new(
      password: "passworddd",
      password_confirmation: "password"
    )
    expect(user).to_not be_valid
    expect(user.errors.full_messages).to include("Password confirmation doesn't match Password")

    end


  it "is not valid without an unique email " do

    user1 = User.new(
    password: 'password',
    name: 'diana',
    password_confirmation: 'password',
    email: 'xero@yahoo.com'
    )
      user1.save

    user2 = User.new(
    password: 'password',
    name: 'diana',
    password_confirmation: 'password',
    email: 'xero@yahoo.com'
    )
      user2.save


    expect(user2).to_not be_valid
      # expect(user.errors.full_messages).to include("")
    end

    it "is not valid with a short password" do
    user = User.new(
      email: 'd@g.com',
      name: 'diana',
      password: 'ela',
      password_confirmation: 'ela'
    )

    expect(user).to_not be_valid
    expect(user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")

    end

  end


  describe 'Class Methods' do
    it "should return an instance of the user " do
      user = User.new(
        password: 'password',
        password_confirmation: 'password',
        email: 'maria@gmail.com',
        name: 'diana'
    )
      user.save
      user1 = User.authenticate_with_credentials('maria@gmail.com','password')
      expect(user1).to eq user

    end

    it "should work if spaces around email " do
      user = User.new(
        password: 'password',
        password_confirmation: 'password',
        email: 'maria@gmail.com',
        name: 'diana'
    )
      user.save
      user1 = User.authenticate_with_credentials(' maria@gmail.com ','password')
      expect(user1).to eq user

    end

    it "should work if email has capital letteres " do
      user = User.new(
        password: 'password',
        password_confirmation: 'password',
        email: 'maria@gmail.com',
        name: 'diana'
    )
      user.save
      user1 = User.authenticate_with_credentials('Maria@gmail.com','password')
      expect(user1).to eq user

    end
  end

end
