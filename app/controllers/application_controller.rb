class ApplicationController < ActionController::API
    respond_to :html, :json

    before_action :configure_permitted_parameters, if: :devise_controller?

    protected
 
    def configure_permitted_parameters
     devise_parameter_sanitizer.permit(:sign_up)  {|u| u.permit(:first_name, :email, :password, :password_confirmation)}
     devise_parameter_sanitizer.permit(:sign_in)  {|u| u.permit(:email, :password)}
     devise_parameter_sanitizer.permit(:account_update)  {|u| u.permit(:first_name, :email, :password, :password_confirmation, :current_password, :edit)}
     devise_parameter_sanitizer.permit(:edit) {|u| u.permit(:reset_password_token)}
    end

end
