require 'spec_helper'

describe ItemsController do

  describe "GET 'index'" do
    it "should return http success" do
      get 'index'
      response.should be_success
    end
  end

  describe "Creating a new Item" do
    it "should display a page for creating a new question" do
      get 'new'
      response.should be_success
    end

    it "should respond to a post request" do # to create a question
      post 'create'
      response.should be_success
    end

    it "should create a new DB record" do
      # valid_parameters = {item: { name: "my item name",
      #                             description: "my item description",
      #                             cost: 99.99,
      #                             url: 'http://www.google.com' }}
      # expect { post('create', valid_parameters) }.to change(Item.count).by(1)
    end
  end

end
