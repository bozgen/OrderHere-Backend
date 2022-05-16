class UsersController < ApplicationController
  before_action :set_user, only: %i[ show update destroy ]

  # POST /users
  def create
    @user = User.new(user_params)
    @user.add_token(:session, expires_at: 2.days.from_now)
    if @user.save
      render :create, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:username, :email, :encrypted_password, :encrypted_token, :role)
    end
end
