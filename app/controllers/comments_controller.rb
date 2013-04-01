class CommentsController < ItemsController
  before_filter :authenticate_user!, :only => [:create]
  before_filter :find_item, :only => [:create]

  def index
    @comments = Comment.all
  end

  def create
    @comment = Comment.new(params[:comment])
    @comment.user = current_user
    @comment.item = @item

    if @comment.save
      # Email disabled for now since the password won't work
      # ItemsMailer.item_notification(current_user, @item).deliver
      # redirect_to @item, :notice => "Comment created!"
      
      # The actual response to a successful save can be found in /views/comments/create.js.erb
    else
      redirect_to @item, :notice => "There was an error"
    end
  end

  def destroy
    @comment = current_user.comment
    if @comment.destroy
      redirect_to item_path(@comment.item)
    else
      redirect_to item_path(@comment.item), :notice => "There was a problem :("
    end
  end
end
