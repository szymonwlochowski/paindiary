class HomeController < ApplicationController
  before_filter :authenticate_user!
  def index
    #binding.pry
    #puts "#{current_user.email}"
  end

end
