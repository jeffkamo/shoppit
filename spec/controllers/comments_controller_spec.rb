require 'spec_helper'

describe CommentsController do

  describe "GET 'index'" do
    it "should return http success" do
      get 'index'
      response.should be_success
    end
  end
  
end
