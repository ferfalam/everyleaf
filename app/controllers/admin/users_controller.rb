class Admin::UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy]
  before_action :is_admin

  def index
    @users = User.all
  end
  

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save 
      redirect_to admin_users_path, notice: "User created"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to admin_users_path, notice: "User credentials update"
    else
      render :new
    end
  end
  
  def show
  end

  def destroy
    @user.destroy
    redirect_to admin_users_path, notice: "Delete successfully"
  end
  
  def role
    @user = User.find(params[:id])
    current = @user.admin
    @user.save(validate:false)

    if current == @user.admin
      redirect_to admin_users_path, notice: "You cannot cahnge your role. You are the only admin"
    else
      redirect_to admin_users_path, notice: "Role of #{@user.email} has been changed"
    end
  end
  

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email,:password, :password_confirmation)
  end

  def is_admin
    if current_user
      unless current_user.admin?
        redirect_to tasks_path
      end  
    else
      redirect_to new_session_path
    end
  end  
end
