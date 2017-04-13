class UsersController < ApplicationController

  # GET /users
  def index
    @user = User.new
  end

  # POST /users
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = ["Provider was successfully created."]
      redirect_to root
    else
      flash.now[:notice] = @user.errors.full_messages
      render :index
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password_digest, :confirm_password_digest)
  end
end
