class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
    render :nothing => true
    # redirect to newly created item
  end

  # def vote
  # end

  # def devote
  # end

  # def popular
  # end
end
