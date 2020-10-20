require 'rails_helper'

RSpec.describe User, type: :model do

  before(:each) do
    @user = User.new(id: 1, first_name: 'Jack', last_name: "Monroe", email: 'jack@gmail.com', password: '123asd', password_confirmation: '123asd')
    @user.save
  end

  it "is not valid without first name" do
    @user.first_name = nil
    expect(@user).to_not be_valid
  end

  it "is not valid without last name" do
    @user.last_name = nil
    expect(@user).to_not be_valid
  end

  it "is not valid without email" do
    @user.email = nil
    expect(@user).to_not be_valid
  end

  it "is not valid when given email that existed" do
    @new_user = User.new(id: 2, first_name: 'new', last_name: "user", email: 'jack@gmail.com', password: '123asd', password_confirmation: '123asd')
    @new_user.valid?
    expect(@new_user).to_not be_valid
  end

  it "is not valid when password and password confirmation are not matched" do
    @user.password_confirmation = "124aaa"
    expect(@user).to_not be_valid
  end

  describe ".authenticate_with_credentials" do
    it "should login when email and password are matched and email are uppecase" do
      @user = @user.authenticate_with_credentials('jAck@gMail.com', '123asd')
      expect(@user).to be_truthy
    end

    it "should not login when email and password are not matched" do
      @user = @user.authenticate_with_credentials('jack@gmail.com', 'wrongpassword')
      expect(@user).to be_falsey
    end
  end

end

