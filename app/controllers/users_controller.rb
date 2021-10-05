class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)

    if @user.save
      redirect_to new_user_path, alert: "User created"
    else
      render :new, alert: "Failed to create user"
    end
  end


  private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

end