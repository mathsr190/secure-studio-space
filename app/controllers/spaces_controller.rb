class SpacesController < ApplicationController
  before_action :authenticate_manager!, only: [:new, :edit]
  before_action :move_to_index, only: [:edit]
  def index
    @studio = Studio.find(params[:studio_id])
  end

  def show
    @space = Space.find(params[:id])
    @studio = @space.studio
  end

  def new
    @studio = Studio.find(params[:studio_id])
    # @space = @studio.spaces.new
    @space_form = SpaceForm.new
  end

  def create
    @studio = Studio.find(params[:studio_id])
    @space_form = SpaceForm.new(space_form_params)
    if @space_form.valid?
      @space_form.save
      redirect_to studio_spaces_path(@studio.id)
    else
      render :new
    end
  end

  def edit
    @space = Space.find(params[:id])
    @studio = @space.studio
    space_attributes = @space.attributes
    # @space_form = SpaceForm.new(space: @space)
    @space_form = SpaceForm.new(space_attributes)
  end

  def update
    @space = Space.find(params[:id])
    @studio = @space.studio
    space_attributes = @space.attributes
    # @space_form = SpaceForm.new(space_form_params, space: @space)
    @space_form = SpaceForm.new(space_attributes)
    @space_form.image ||= @space.image
    # @space_form = SpaceForm.new(space_attributes)
    if @space_form.valid? # @space_form.save
      # @space_form.save
      @space_form.update(space_form_params, @space)
      redirect_to studio_space_path(@space.id, studio_id: @studio.id)
    else
      render :edit
    end
  end

  private

  def space_form_params
    # params.require(:space).permit(:info, :space_name, :space_name_kana, :length, :width, :size, :height, :fee_morning, :fee_day, :fee_night, :image).merge(studio_id: params[:studio_id])
    params.require(:space_form).permit(:info, :space_name, :space_name_kana, :length, :width, :size, :height, :fee_morning,
                                       :fee_day, :fee_night, :image).merge(studio_id: params[:studio_id])
  end

  def move_to_index
    @space = Space.find(params[:id])
    redirect_to action: :index if @space.studio.manager.id != current_manager.id
  end
end
