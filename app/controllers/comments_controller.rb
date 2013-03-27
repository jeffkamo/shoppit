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
      ItemsMailer.item_notification(current_user, @item).deliver
      redirect_to @item, :notice => "Comment created!"
    else
      redirect_to @item, :notice => "There was an error"
    end
  end
end
