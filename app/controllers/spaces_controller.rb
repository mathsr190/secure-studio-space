class SpacesController < ApplicationController
  def index
  end

  def new
    @studio = Studio.find(params[:studio_id])
    #@space = @studio.spaces.new
    @space_form = SpaceForm.new
  end

  def create
    @studio = Studio.find(params[:studio_id])
    #@space = @studio.spaces.new(space_params)
    #if @space.save
    #  redirect_to root_path
    #else
    #  @studio = Studio.find(params[:studio_id])
    #  @space = @studio.spaces.new(space_params)
    #  render :new
    #end
    @space_form = SpaceForm.new(space_form_params)
    if @space_form.valid?
      @space_form.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def space_form_params
    #params.require(:space).permit(:info, :space_name, :space_name_kana, :length, :width, :size, :height, :fee_morning, :fee_day, :fee_night, :image).merge(studio_id: params[:studio_id])
    params.require(:space_form).permit(:info, :space_name, :space_name_kana, :length, :width, :size, :height, :fee_morning, :fee_day, :fee_night, :image).merge(studio_id: params[:studio_id])
  end

end
