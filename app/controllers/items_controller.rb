class ItemsController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]
  before_filter :find_item, :only => [:show, :edit, :update, :destroy]

  def index
    @items = Item.all
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
      # render :new, :notice => "Something went wrong..."
      redirect_to @item, :notice => "Something went wrong..."
    end
  end

  def show
    # Get the current item's comments
    @all_comments = @item.comments

    # Prepare an empty comment
    @comment = Comment.new
  end

  def edit
  end

  def update
    if @item.update_attributes(params[:item])
      redirect_to item_path(@item)
    else
      render :edit
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
end
