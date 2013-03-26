class CommentsController < ItemsController
  before_filter :find_item, :only => [:create]

  def index
    @comments = Comment.all
  end

  def create
    @comment = Comment.new(params[:comment])
    @comment.item = @item

    if @comment.save
      redirect_to @item, :notice => "Comment created!"
    else
      redirect_to @item, :notice => "There was an error"
    end
  end
end
