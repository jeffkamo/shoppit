class ItemsController < ApplicationController
  before_filter :find_item, :only => [:show, :edit, :update, :destroy]

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(params[:item])
    if @item.save
      redirect_to item_path(@item)
    else
      render :new
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
