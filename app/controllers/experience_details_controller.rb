class ExperienceDetailsController < ApplicationController
  before_action :authenticate_admin!

  def create
    @experience = Experience.find(params[:experience_id])
    @detail = @experience.experience_details.build(detail_params)

    if @detail.save
      redirect_to @experience, notice: "Detail was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @experience = Experience.find(params[:experience_id])
    @detail = @experience.experience_details.find(params[:id])
  end

  def update
    @experience = Experience.find(params[:experience_id])
    @detail = @experience.experience_details.find(params[:id])
    if @detail.update(detail_params)
      redirect_to @experience
    else
      render 'edit'
    end
  end

  def destroy
    @experience_detail = ExperienceDetail.find(params[:id])
    @experience_detail.destroy
    redirect_to experience_path(params[:experience_id])
  end

  private

  def authenticate_admin!
    redirect_to login_path unless session[:admin]
  end

  def detail_params
    params.require(:experience_detail).permit(:description)
  end
end
