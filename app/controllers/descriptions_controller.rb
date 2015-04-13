class DescriptionsController < ApplicationController

  expose(:description, attributes: :description_params)
  expose(:descriptions) { Description.own(current_user.id) }

  def create
    if description.save
      redirect_to descriptions_path, notice: 'You created a description.'
    else
      render :new
    end
  end

  def update
    if description.save
      redirect_to descriptions_path, notice: 'You updated a description.'
    else
      render :edit
    end
  end

  def destroy
    description.destroy
    redirect_to descriptions_path, alert: 'You deleted a description.'
  end


  private

    def description_params
      params.require(:description).permit(:name, :user_id)
    end

end
