class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper
  before_action :require_signin

  #GET
  def welcome
  end

  #POST
  def show
    @posts_results = Posts.show(params[:show])
  end

end
