class StudiosController < ApplicationController
  before_action :authenticate_manager!, only: [:new, :edit]
  def index
  end

  def new
    @studio = Studio.new
  end

  def create
  end

  def edit
  end

  def show
  end

end