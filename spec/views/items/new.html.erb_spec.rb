require 'spec_helper'

describe "items/new.html.erb" do

  before do
    assign :item, Item.new
  end

  newPageText = "New Item!"
  it "should contain the heading '#{newPageText}'" do
    render
    rendered.should include(newPageText)
  end

  it "should display a form with one text field, textarea and submit button" do
    render
    assert_select "form" do
      assert_select "input[name=?]", "item[name]"
      assert_select "textarea[name=?]", "item[description]"
      assert_select "input[type=?]", "submit"
    end
  end
end

# Testing new migrations on the new database:
#   $ rake db:test:prepare

# This test (i.e. all view specs) don't pass through a controller
# which means you must pass (or assign) instance variables to the
# test cases manually.