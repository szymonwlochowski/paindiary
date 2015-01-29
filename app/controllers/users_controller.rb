class UsersController < ApplicationController

  expose(:user)
  expose(:users)

  def update_layout
    user.update_attributes(layout_name: params[:layout])
    redirect_to root_path, notice: 'well done Hose'
  end

  private

    def user_params
      params.require(:user).permit(:city, :sex, :layout_name)
    end

end
