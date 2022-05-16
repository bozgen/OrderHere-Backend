include ActionController::MimeResponds

class RegistrationsController < Devise::RegistrationsController
    respond_to :json

    def create
      user = User.new(user_params)
      user.save
      respond_with(user)
    end

    private
    def respond_with(resource, _opts = {})
      resource.persisted? ? register_success : register_failed
    end
    def register_success
      render json: { message: 'Signed up.' }
    end
    def register_failed
      render json: { message: "Signed up failure." }
    end
    
    def user_params
      params.require(:user).permit(:id, :username, :email, :is_owner)
    end


  end