class SessionsController < ApplicationController
  skip_before_action :login_required, only: [:new, :create]

  def new
    if logged_in?
      redirect_to user_path(current_user.id)
    end
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to user_path(user.id)
    else
      redirect_to new_session_path, notice: "Credentials not recognized"
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to new_session_path
  end
end
