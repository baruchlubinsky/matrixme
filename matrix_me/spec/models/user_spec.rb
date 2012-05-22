require 'spec_helper'

describe User do
  
  describe "Fields" do 
    u = User.new
    it "should have a name" do
      u.should be_respond_to(:name)
    end
    
    it "should have a email" do
      u.should be_respond_to(:email)  
    end
    
    it "should have a password" do
      u.should be_respond_to(:password)
    end
    
    describe "Validation" do
      u.name = "Name" + Time.now.to_i.to_s
      u.password = "pw"
      it "should allow legitimate details" do
        u.email = u.name + "@mail.com"
        u.should  be_valid
      end
      it "should not allow incorrect emails" do
        u.email = "not an email"
        u.should_not be_valid
      end
      it "should not allow dublicate emails" do
        n = User.new({:name => u.name, :email => u.email, :password => u.password})
        n.should_not be_valid
      end
    end
    
  end
  
  describe "Password" do
    
    it "should calculate the same hash when password is assigned" do
      password = "password"
      u = User.new
      u.password = password
      u.password.should == u.hash_password(password)     
    end
  end
  
  describe "Constructor" do
    it "should create a user object" do
      u = User.new
      u.should_not be_nil
    end
    
    it "should accept a hash of arguments" do
      name = 'n'
      email = 'name@email.com'
      pw = 'password'
      u = User.new({:name => name, :email => email, :password => pw})
      u.name.should eq(name)
      u.email.should eq(email)
      u.password.should == u.hash_password(pw)
    end
  end
  
end