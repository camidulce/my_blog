class SessionsController < ApplicationController
  skip_before_action :require_signin, only: [:new, :create]

  def new
  end

  def create
    #Find user by their email
    user = User.find_by(email: params[:session][:email].downcase)

    #Test if tge user was found AND authenticates
    if user && user.authenticate(params[:session][:password])
      #redirect_to root_url, notice: "Logged in!"
      #TODO Sign In the User
      sign_in(user)
      redirect_back_or(root_path)
    else
      flash[:error] = "Invalid email/password"
      redirect_to new_sessions_path
    end
  end

  def destroy
    sign_out
    redirect_to root_url
  end

end
