class CommentsController < ApplicationController
  def index
    @comments = Comment.all
  end

  def new
    @comment = Comment.new
  end

  def create
    render :nothing => true
  end
end
