class UsersController < ApplicationController
  def new
  	@user = User.new
  end

  def edit
    @user = User.find(current_user)
  end

  def create
		@user = User.new(user_params)

		if @user.save
      flash[:notice] = "Te has registrado correctamente"
		  redirect_to root_path
		else
			render 'new'
		end
	end

	def update
    @user = User.find(current_user)

    if @user.update(user_params)
      redirect_to root_path
    else
    	render 'edit'	
    end
	end

  private
  	def user_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation)
  	end

end


