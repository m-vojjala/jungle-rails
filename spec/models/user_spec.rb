require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
 it 'should create a user when all validations are true' do
  @user=User.new(name:"john", email:"joe@amith@ymail.com", password:"1234", password_confirmation:"1234")
  @user.save
  expect(@user.errors).not_to include("can\'t be blank")
 end
 it 'should not create a user when name is missing' do
  @user=User.new(email:"joe@amith@ymail.com", password:"1234", password_confirmation:"1234")
  @user.save
  expect(@user.errors[:name]).to include("can\'t be blank")
 end
 it 'should not create a user when email is missing' do
  @user=User.new(name:"john", password:"1234", password_confirmation:"1234")
  @user.save
  expect(@user.errors[:email]).to include("can\'t be blank")
 end
 it 'should not create a user when password is missing' do
  @user=User.new(name:"john", email:"joe@amith@ymail.com", password_confirmation:"1234")
  @user.save
  expect(@user.errors[:password]).to include("can\'t be blank")
 end
 it 'should not create a user if email is not unique' do
  @user1=User.new(name:"john", email:"joe@amith@ymail.com", password:"1234567", password_confirmation:"1234567")
  @user1.save
  @user2=User.new(name:"Jay", email:"JOE@AMITH@ymail.com", password:"1234876", password_confirmation:"1234876")
  @user2.valid?
  expect(@user2.errors[:email]).to include("has already been taken")
 end
 it 'should not create a user when passwords do not match' do
  @user=User.new(name:"john", email:"joe@amith@ymail.com", password:"1234", password_confirmation:"12345")
  @user.save
  expect(@user.errors[:password_confirmation]).to include("doesn\'t match Password")
 end
 it 'should not create user if password is too short' do
  @user=User.new(name:"john", email:"joe@amith@ymail.com", password:"1234", password_confirmation:"1234")
  @user.save
  expect(@user.errors[:password]).to include("is too short (minimum is 6 characters)")
 end
end
  describe '.authenticate_with_credentials' do
    it 'should authenticate user if there are spaces before/after email' do
      @user = User.new(name:"john", email: "joe@ymail.com", password: "1334518", password_confirmation: "1334518")
      @user.save!
      expect(User.authenticate_with_credentials("  joe@ymail.com   ", "1334518")).to be_present
    end
    it 'should authenticate user if the email case is different' do
      @user = User.new(name:"john", email: "joe@ymail.com", password: "1234567", password_confirmation: "1234567")
      @user.save!
      expect(User.authenticate_with_credentials("JOe@ymail.com", "1234567")).to be_present
    end
  end
end