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

  describe "Updating an Item" do
    let(:item) { Item.create!(
      :name => 'My Name',
      :description => 'My description',
      :cost => 99.99,
      :url => 'www.google.com'
    )}

    context "calling edit" do
      before { get 'edit', { :id => item.id } }
      it "should fetch the current question" do
        assigns(:item).should eq(item)
      end

      it "should render the edit template" do
        response.should render_template('edit')
      end
    end

    context "calling update" do
      context "with valid parameters" do
        let(:valid_parameters) {{ :description => 'My new description' }}

        before { put 'update', { :id => item.id, :item => valid_parameters } }

        it "should change the value of attributes passed to the update" do
          Item.find(item.id).description.should eq valid_parameters[:description]
        end

        it "should redirect to Item show page with successful update" do
          response.should redirect_to item_path(item)
        end
      end

      context "with invalid parameters" do
        let(:invalid_parameters) { { :name => "" } }

        before { put 'update', { :id => item.id, :item => invalid_parameters } }

        it "should NOT change the value of attributes" do
          Item.find(item.id).name.should eq item.name
        end

        it "should render the :edit template" do
          response.should render_template(:edit)
        end
      end
    end
  end

  describe "Destroy an Item" do
    let(:item) { Item.create!({
      :name => 'My Name',
      :description => "My description",
      :cost => 99.99,
      :url => 'http://www.google.com'
    }) }

    it "should delete the item from the database" do
      delete 'destroy', :id => item.id
      Item.find_by_id(item.id).should == nil
    end

    it "should redirect to the Index list page after successfull delete" do
      delete 'destroy', :id => item.id
      response.should redirect_to items_path
    end
  end
end
