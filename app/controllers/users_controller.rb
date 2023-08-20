class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, notice: "Sign up sucessfully"
    else
      render :new, status: :unproccessable_entity
    end
  end

  private

  def user_params
    params.require(:session).permit(:email, :password, :password_confirmation)
  end
end
