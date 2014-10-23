class HomeController < ApplicationController
  skip_before_action :require_signin, only: [:welcome]

  def welcome
  end

end
