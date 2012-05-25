class WorkspacesController < ApplicationController
  #before_filter :check_login
  def index
    @workspaces = @user.workspaces.to_a
  end
  def show
    @workspace = Workspace.find(params[:id])
    @project = @workspace.project
    @new_matrix_object = MatrixObject.new
    @object_types = [Member.new, Conversation.new, Content.new]
    @current_object = MatrixObject.find(@workspace.current_object_id) unless @workspace.current_object_id.nil?
  end
  def update
    @workspace = Workspace.find(params[:id])
    @workspace.write_attributes(params[:workspace])
    @workspace.save
    redirect_to @workspace
  end
end
