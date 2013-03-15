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

    it "should create a new DB record" do
      valid_parameters = {item: { name: "my item name",
                                  description: "my item description",
                                  cost: 99.99,
                                  url: 'http://www.google.com' }}
      expect { post('create', valid_parameters) }.to change { Item.count }.by(1) 
    end

    it "should redirect to Item show page after creating the record" do
      valid_parameters = {item: { name: "my item name",
                                  description: "my item description",
                                  cost: 99.99,
                                  url: 'http://www.google.com' }}
      post "create", valid_parameters
      response.should redirect_to item_path(Item.find_by_name('my item name'))
    end

    it "should not save a record if the name is missing" do
      invalid_parameters = {item: { name: nil,
                                  description: "my item description",
                                  cost: 99.99,
                                  url: 'http://www.google.com' }}
      expect { post "create", invalid_parameters }.to_not change { Item.count }
    end

    it "should not save a record if the cost is missing" do
      invalid_parameters = {item: { name: "the name",
                                  description: "my item description",
                                  cost: nil,
                                  url: 'http://www.google.com' }}
      expect { post "create", invalid_parameters }.to_not change { Item.count }
    end

    it "should not save a record if the url is missing" do
      invalid_parameters = {item: { name: "the name",
                                  description: "my item description",
                                  cost: 99.99,
                                  url: nil }}
      expect { post "create", invalid_parameters }.to_not change { Item.count }
    end

    it "should render the New template when form data is missing" do
      invalid_parameters = {item: { name: "the name",
                                  description: "my item description",
                                  cost: 99.99,
                                  url: nil }}
      post "create", invalid_parameters
      response.should render_template(:new)
    end
  end
end
