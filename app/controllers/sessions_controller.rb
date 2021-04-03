class SessionsController < ApplicationController
  def new
  end
  def create
    user = User.find_by(email: session_params[:email].downcase)
    if user && user.authenticate(session_params[:password])
      session[:user_id] = user.id
      redirect_to user_path(user.id)
    else
      flash.now[:danger] = 'ログインに失敗しました'
      render :new
    end
  end
  private
  def session_params
    params.require(:session).permit(:email, :password)
  end
end
