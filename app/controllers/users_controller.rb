class UsersController < ApplicationController

  expose(:user)
  expose(:users)

  private

    def user_params
      params.require(:user).permit(:city)
    end

end
