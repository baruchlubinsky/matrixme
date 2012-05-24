class NavigationsController < ApplicationController
  #before_filter :check_login
  def edit
    @workspace = Workspace.find(params[:workspace_id])
    @workspace.matrix_location.data = params[:id].split(MatrixLocation::Separator)
    @workspace.save
    redirect_to @workspace   
  end
end