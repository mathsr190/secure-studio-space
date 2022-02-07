class StudiosController < ApplicationController
  before_action :authenticate_manager!, only: [:new, :edit]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_studio, only: [:show, :edit, :update]
  before_action :move_to_index_manager, only: [:edit]
  def index
    @studios = Studio.all.includes(:manager, :spaces)
  end

  def show
    @studiobday = StudioBday.where(studio_id: @studio.id).order(bday_id: :asc)
  end

  def new
    @studio = Studio.new
  end

  def create
    @studio = Studio.new(studio_params)
    if @studio.save
      redirect_to studio_path(@studio.id)
    else
      render new_studio_path
    end
  end

  def edit
  end

  def update
    if @studio.update(studio_params)
      redirect_to studio_path(params[:id])
    else
      render :edit
    end
  end

  private

  def set_studio
    @studio = Studio.find(params[:id])
  end

  def studio_params
    params.require(:studio).permit(:introduction, :postal_code, :prefecture_id, :city, :address, :access, :business_hours_start,
                                   :business_hours_end, :phone_number, :image, { bday_ids: [] }).merge(manager_id: current_manager.id)
  end

  def move_to_index_manager
    @studio = Studio.find(params[:id])
    redirect_to action: :index if @studio.manager.id != current_manager.id
  end
end