class ExperiencesController < ApplicationController 
  before_action :authenticate_admin!, except: [:index, :show]

  def index
    @experiences = Experience.all
  end

  def show
    @experience = Experience.find(params[:id])
  end

  def new
    @experience = Experience.new
  end

  def create
    @experience = Experience.new(experience_params)

    if @experience.save
      flash[:notice] = 'Experience created successfully!'
      redirect_to @experience
    else
      flash[:alert] = 'Experience could not be created'
      render 'new'
    end
  end

  def edit
    @experience = Experience.find(params[:id])
  end

  def update
    @experience = Experience.find(params[:id])

    if @experience.update(experience_params)
      flash[:notice] = 'Experience updated successfully!'
      redirect_to @experience
    else
      render 'edit'
    end
  end

  def destroy
    @experience = Experience.find(params[:id])
    @experience.destroy
    flash[:notice] = 'Experience deleted successfully!'
    redirect_to experiences_path
  end

  private

  def authenticate_admin!
    redirect_to login_path unless session[:admin]
  end

  def experience_params
    params.require(:experience).permit(:company, :position, :start_date, :end_date, :description, experience_details_attributes: [:id, :bullet, :_destroy])
  end
end
