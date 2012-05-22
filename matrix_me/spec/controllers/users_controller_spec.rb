require 'spec_helper'

describe UsersController do
  #ensure that pages exist
  render_views
  
  describe "GET 'new'" do
    it "is successful" do
      get 'new'
      response.should be_success
    end
  end
  
  describe "POST" do
    it "saves a user record" 
  end
  
end