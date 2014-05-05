class Api::V1::UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @page_title = @user.name
  end
end