class SessionsController < ApplicationController
  def new
  end

  def create
    if params[:session][:email] == ENV['ADMIN_EMAIL'] && params[:session][:password] == ENV['ADMIN_PASSWORD']
      session[:admin] = true
      redirect_to experiences_path, notice: 'Logged in successfully.'
    else
      flash.now[:alert] = 'Invalid password.'
      render :new
    end
  end

  def destroy
    session.delete(:admin)
    redirect_to root_path, notice: 'Logged out successfully.'
  end
end
