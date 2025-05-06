class RegistrationsController < ApplicationController
  skip_before_action :verify_authenticity_token
  respond_to :json

  def create
    user = User.new(user_params)
    if user.save
      # Generate token for the new user
      token = JsonWebToken.encode(user_id: user.id)
      render json: { message: "Signup successful", token: token, user: user.as_json(only: [:id, :email, :name,:role]) }, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.permit(:name, :email, :password, :password_confirmation,:role)
  end
end
