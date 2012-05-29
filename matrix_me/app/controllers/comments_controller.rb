class CommentsController < ApplicationController
  before_filter :check_login
  def create
    @conversation = Conversation.find(params[:conversation_id])
    @comment = Comment.new(params[:comment])
    @comment.user = @user
    @conversation.comments << @comment
    @conversation.save
    redirect_to :back
  end
end