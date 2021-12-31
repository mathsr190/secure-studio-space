class StudiosController < ApplicationController
  before_action :authenticate_manager!, only: [:new, :edit]
  def index
  end

  def new
    @studio = Studio.new
  end

  def create
    @studio = Studio.new(studio_params)
    if @studio.save
      redirect_to studio_path(current_manager.id)
    else
      render new_studio_path
    end
  end

  def edit
  end

  def show
  end

  private
  def studio_params
    params.require(:studio).permit(:introduction, :postal_code, :prefecture_id, :city, :address, :access, :business_day, :business_hours_start, :business_hours_end, :phone_number).merge(manager_id: current_manager.id)
  end
end