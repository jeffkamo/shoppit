require 'spec_helper'

describe "items/show.html.erb" do
  before do
    assign :item, Item.create(
      :name => "Product Name",
      :description => "Product Description",
      :url => "http://www.google.com",
      :cost => 199.99
    )
  end

  describe "Displaying Comments" do
    # let(:comment) { Comment.create!(
    #   :dialogue => "The comment dialogue"
    # )}

    it "should list all associated comments" do
      # render
      # render.should include(c[:dialogue])
    end
  end
end