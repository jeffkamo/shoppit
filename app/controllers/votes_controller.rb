class VotesController < ItemsController
  before_filter :find_item
  before_filter :find_authenticated_item, :except => [:create, :destroy]

  def create
    @vote = Vote.new
    @vote.user = current_user
    @vote.item = @item
    @vote.is_vote_up = params[:is_vote_up] || true

    if !current_user.has_voted?(@item) && @vote.save
      redirect_to @item, :notice => 'Vote added'
    else
      redirect_to @item, :alert => 'You already voted!'
    end
  end

  def destroy
    @vote = Vote.find(params[:id])
    if @vote.destroy
      redirect_to @item, :notice => "Vote removed"
    else
      redirect_to @item, :alert => "Something went wrong!"
    end
  end
end
