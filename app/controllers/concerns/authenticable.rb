# app/controllers/concerns/authenticable.rb
module Authenticable
  extend ActiveSupport::Concern

  def authenticate_request
    header = request.headers['Authorization']
    return unauthorized_response unless header

    token = header.split(' ').last
    decoded = JsonWebToken.decode(token)
    @current_user = User.find_by(id: decoded[:user_id]) if decoded

    unauthorized_response unless @current_user
  end

  private

  def unauthorized_response
    render json: { error: 'Unauthorized' }, status: :unauthorized
  end
end
