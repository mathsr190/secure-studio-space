class ManagersController < ApplicationController
  def show
    @manager = current_manager
    @studio = @manager.studio
    # if @studio == nil
    # else
    #  @studiobday = StudioBday.where(studio_id:@studio.id).order(bday_id: :asc)
    # end
  end
end
