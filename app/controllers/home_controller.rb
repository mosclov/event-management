class HomeController < ApplicationController
  def index
    redirect_to '/prospects' if current_user
  end
end
