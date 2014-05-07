class Api::V1::UsersController < ApiController
  def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      render :show
    else
      render json: {
        message: 'Validation Failed',
        errors: @user.errors.full_messages
      }, status: 422
    end
  end

  def show
    @user = User.find(params[:id])
    @page_title = @user.name
  end

  private
    def user_params
      {
        name: params[:name],
        email: params[:email],
        password: params[:password],
        password_confirmation: params[:password_confirmation]
      }
    end
end