class MatrixObjectsController < ApplicationController
  before_filter :check_login
  def create
    @workspace = Workspace.find(params[:workspace_id])
    @matrix_object = MatrixObject.new(params[:matrix_object])
    @matrix_object.misc_attributes = params[:misc_attributes]
    @matrix_object.project = @workspace.project
    @matrix_object.matrix_location = @workspace.matrix_location
    #@matrix_object.user = @user
    @matrix_object.save
    @workspace.current_object_id = @matrix_object.id
    @workspace.save
    redirect_to @workspace
  end
end