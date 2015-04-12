class ErrorsController < ApplicationController
  before_filter :authenticate_user!, except: [:file_not_found, :unprocessable, :internal_server_error]
  def file_not_found
  end

  def unprocessable
  end

  def internal_server_error
  end
end
