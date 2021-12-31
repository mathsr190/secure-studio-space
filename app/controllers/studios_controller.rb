class StudiosController < ApplicationController
  before_action :authenticate_manager!, only: [:new, :edit]
  before_action :move_to_index, only: [:new]
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
    @studio = Studio.find(params[:id])
  end

  def show
    @studio = current_manager.studio
  end

  def update
    @studio = current_manager.studio
    if @studio.update(studio_params)
      redirect_to studio_path(current_manager.id)
    else
      render :edit
    end
  end

  private
  def studio_params
    params.require(:studio).permit(:introduction, :postal_code, :prefecture_id, :city, :address, :access, :business_hours_start, :business_hours_end, :phone_number, :image, {:bday_ids => []}).merge(manager_id: current_manager.id)
  end

  def move_to_index
    @manager = current_manager
    redirect_to action: :index if !@manager.studio.nil?
  end
end