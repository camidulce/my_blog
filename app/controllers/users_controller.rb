class UsersController < ApplicationController
  skip_before_action :require_signin, only: [:new, :create]


  def index
    @users = User.all
  end

  def new #Sign Up
    @user = User.new
  end

  def create
    @user = User.new(users_params)
    if @user.save
      sign_in @user
      redirect_to @user #goes to user - show.html.erb
    else
      render :new    #rails will look in views folder for new.html.erb
    end
  end

  #/users/7
  def show
    @user = User.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def users_params
    params.require(:user).permit(
      :name,
      :email,
      :password,
      :password_confirmation
    )
  end
end
