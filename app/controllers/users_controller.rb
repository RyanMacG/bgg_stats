class UsersController < ApplicationController
  def new
    @page_title = "Sign up"
  end

  def show
    @user = User.find(params[:id])
    @page_title = @user.name
  end
end
