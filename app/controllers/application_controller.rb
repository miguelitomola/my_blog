class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user_session, :current_user
      
  before_action :set_aside_elements

  private
    def current_user_session
      return @current_user_session if defined?(@current_user_session)
      @current_user_session = UserSession.find
    end
    
    def current_user
      @current_user = current_user_session && current_user_session.record
    end

    def require_admin
      logger.debug "ApplicationController::require_user"
      unless current_user && current_user.admin_flag == true
        store_location
        flash[:notice] = "Para acceder a esta página tienes que ser administrador"
        redirect_to new_user_session_url
        return false
      end
    end

    def require_user
      logger.debug "ApplicationController::require_user"
      unless current_user
        store_location
        flash[:notice] = "Para esta acción debes iniciar sesión"
        redirect_to new_user_session_url
        return false
      end
    end
  
    def require_no_user
      logger.debug "ApplicationController::require_no_user"
      if current_user
        store_location
        flash[:notice] = "Para esta acción debes finalizar sesión"
        redirect_to account_url
        return false
    end
    end
  
    def store_location
      session[:return_to] = request.url
    end

    def set_aside_elements  
      @dates_aside = ArticlesDate.print_dates
    end  
end
  

