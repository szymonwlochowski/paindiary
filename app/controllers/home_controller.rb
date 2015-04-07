class HomeController < ApplicationController
  before_filter :authenticate_user!, except: [:about, :help, :faq]
  def index
  end

  def about
  end

  def help
  end

  def faq
  end

end
