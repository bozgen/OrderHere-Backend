class ApplicationController < ActionController::API
        include DeviseTokenAuth::Concerns::SetUserByToken

        before_action :configure_permitted_parameters, if: :devise_controller?
        include Pundit::Authorization
        rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
        
        
        
        
        def user_not_authorized
                @message = "You are not authorized."
                render json: {message: @message}, status: 401
        end
         
        def configure_permitted_parameters
                devise_parameter_sanitizer.permit(:sign_up, keys: [:firstname, :lastname, :username, :email,
                                                                        :password, :password_confirmation, :shop_id])
        end
end