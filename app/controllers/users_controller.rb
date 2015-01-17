class UsersController < ApplicationController

  def index
    if current_user && current_user.admin_flag == true
      @users = User.all
    else
      @error = "Only admins can see this information"
    end
  end

  def new
  	@user = User.new
  end

  def edit
    if User.find_by(id: params[:id])
      @user = User.find(params[:id])
    else
      @user = User.find(current_user)
    end
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
      params.require(:user).permit(:username, :email, :password, :password_confirmation, :admin_flag)
  	end

end


