class DescriptionsController < ApplicationController

  expose(:description, attributes: :description_params)
  expose(:descriptions) { Description.own(current_user.id) }

  def create
    if description.save
      redirect_to descriptions_path
    else
      render :new
    end
  end

  def update
    if description.save
      redirect_to description_path(description)
    else
      render :edit
    end
  end


  private

    def description_params
      params.require(:description).permit(:name, :user_id)
    end

end
