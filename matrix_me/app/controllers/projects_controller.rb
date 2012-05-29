class ProjectsController < ApplicationController
  before_filter :check_login
  def new
    @project = Project.new
    @templates = PublicTemplate.all.to_a
  end
  def create
    @project = Project.new(params[:project])
    @workspace = Workspace.new(:user => @user, :project => @project)
    @workspace.matrix_location = MatrixLocation.new(:data => [@workspace.project.template.id.to_s])
    @project.save
    @workspace.save
    redirect_to workspace_path(@workspace)
  end
end