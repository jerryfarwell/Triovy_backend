# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  respond_to :json

  def destroy
    signed_out = (Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name))
    render json: {
      status: 200,
      message: "Logged out successfully."
    }, status: :ok
  end

  private

  def respond_with(resource, _opts = {})
    render json: {
      status: {code: 200, message: 'Logged in sucessfully.'},
      data: UserSerializer.new(resource).serializable_hash[:data][:attributes],
      token: JWT.encode({ user_id: resource.id }, Rails.application.credentials.devise[:jwt_secret_key])
    }, status: :ok
  end
  
   #token: JWT.encode({ user_id: resource.id }, Rails.application.credentials.devise[:jwt_secret_key])
   # this line here is important to send the token to the frontend

  def respond_to_on_destroy
    if current_user
      render json: {
        status: 200,
        message: "logged out successfully"
      }, status: :ok
    else
      render json: {
        status: 401,
        message: "Couldn't find an active session."
      }, status: :unauthorized
    end
  end
end
