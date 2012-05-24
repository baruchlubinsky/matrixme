class WorkspacesController < ApplicationController
  #before_filter :check_login
  def index
    @workspaces = @user.workspaces.to_a
  end
  def show
    @workspace = Workspace.find(params[:id])
    @project = @workspace.project
  end
  
end
