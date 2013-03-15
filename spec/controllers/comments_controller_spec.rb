require 'spec_helper'

describe CommentsController do

  describe "GET 'index'" do
    it "should return http success" do
      get 'index'
      response.should be_success
    end
  end

  describe "Creating a new comment" do
    
    it "should respond to a post request" do
      post 'create'
      response.should be_success
    end

    it "should create a new DB record" do
      # 
    end
  end
end
