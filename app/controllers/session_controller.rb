class SessionController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      login_user(user)

      redirect_to(user)
    else
      flash[:notice] = "Invalid Email or Password"
      render 'new'
    end
  end

  def logout

    log_out

    flash[:notice] = "User Logged out"

    redirect_to root_path
  end
end
