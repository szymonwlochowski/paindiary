class DescriptionsController < ApplicationController

  respond_to :html

  def index
    @descriptions = Description.all
    respond_with(@descriptions)
  end

  def new
    @description = Description.new
    respond_with(@description)
  end

  def create
    @description = Description.new(description_params)
    @description.save
    redirect_to descriptions_path
  end

  def edit
    @description = Description.find(params[:id])
  end

  def update
    @description = Description.find(params[:id])
    @description.update(description_params)
    redirect_to descriptions_path
  end

  private

    def description_params
      params.require(:description).permit(:name)
    end

end
