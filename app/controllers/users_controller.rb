class UsersController < ApplicationController
  before_action :set_user, only: %i[ show ]
  skip_before_action :login_required, only: [:new, :create]

  def new
    if logged_in?
      redirect_to tasks_path
    else
      @user = User.new()
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user.id)
    else
      render :new
    end
  end

  def show
    unless @user == current_user
      redirect_to tasks_path
    end
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email,:password, :password_confirmation)
  end

end
