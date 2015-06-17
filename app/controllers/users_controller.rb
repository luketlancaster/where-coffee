class UsersController < ApplicationController
  before_action :load_user, except: [:index]
  def index
    @users = User.all
  end

  def create
    if @user.save
      auto_login(@user)
      redirect_to root_path, notice: "Thanks for signing up, #{@user.name}!"
    else
      flash.alert = "Please fix the errors below to continue"
      render :new
    end
  end

  protected

  def load_user
    if params[:id].present?
      @user = User.find(params[:id])
    else
      @user = User.new
    end
    if params[:user].present?
      @user.assign_attributes(user_params)
    end
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
