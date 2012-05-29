class WorkspacesController < ApplicationController
  before_filter :check_login
  def index
    @workspaces = @user.workspaces.to_a
    @users = User.where(:id.ne => @user.id)
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
    respond_to do |format|
      format.html {redirect_to @workspace}
      format.json {render :json => {:success => true} }
    end
  end
  def create 
    @workspace = Workspace.new(params[:workspace])
    @workspace.matrix_location = MatrixLocation.new(:data => [@workspace.project.template.id.to_s])
    @workspace.save
    redirect_to :back
  end
end
