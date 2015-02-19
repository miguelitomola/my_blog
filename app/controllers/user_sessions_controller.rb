class UserSessionsController < ApplicationController
  
  def new
  	@user_session = UserSession.new
  end

  def create
  	@user_session = UserSession.new(params[:user_session])

  	if @user_session.save
  		flash[:notice] = "Bienvenido #{@user_session.username}"
  	  redirect_to root_path
  	else
  		render 'new'
  	end
  end
  
  def destroy
  	@user_session = UserSession.find
  	@user_session.destroy
  	flash[:notice] = "¡Hasta pronto #{@user_session.username}!"

  	redirect_to root_path
  end

end