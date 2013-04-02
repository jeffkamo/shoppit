class ItemsController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]
  before_filter :find_item, :only => [:show]
  before_filter :find_authenticated_item, :only => [:edit, :update, :destroy]

  def index
    @items = Item.all.reverse
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(params[:item])
    @item.user = current_user
    if @item.save
      redirect_to item_path(@item), :notice => "Item created!"
    else
      redirect_to @item, :alert => "Something went wrong..."
    end
  end

  def show
    # Get the current item's comments
    @all_comments = @item.comments

    # Prepare an empty comment
    @comment = Comment.new

    # Prepare an empty vote
    # @vote = current_user.vote_from(@item)
    @vote = (current_user && current_user.vote_from(@item)) || Vote.new
  end

  def edit
  end

  def update
    if @item.update_attributes(params[:item])
      redirect_to item_path(@item), :notice => "Item Modified!"
    else
      render :edit, :alert => "Something went wrong..."
    end
  end

  def destroy
    if @item.destroy
      redirect_to items_path
    else
      render :nothing => true
    end
  end

  private

  def find_item
    @item = Item.find(params[:item_id] || params[:id])
  end

  def find_authenticated_item
    @item = current_user.items.find(params[:item_id] || params[:id])
  end
end
