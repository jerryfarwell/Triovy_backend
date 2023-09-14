class Users::PasswordController < Devise::PasswordsController
    respond_to :json
  
      def create
          user = User.find_by_email(params[:email])
          if user
            user.send_reset_password_instructions
            render json: { message: "Password reset instructions sent" }, status: :ok
          else
            render json: { message: "Email address not found" }, status: :not_found
          end
      end
  
  
      def edit
        resource = resource_class.new
        set_minimum_password_length
        resource.reset_password_token = params[:reset_password_token]
        redirect_to "https://www.triovy.com/new_password/edit?reset_password_token=#{params[:reset_password_token]}" and return if params[:reset_password_token].present?
      
        respond_with(resource)
      end 
  
        
  
        def update
    
          puts "Reset password token: #{params[:reset_password_token]}"
            user = User.reset_password_by_token(
            reset_password_token: params[:reset_password_token],
            password: params[:password],
            password_confirmation: params[:password_confirmation]
          )
          puts "User: #{user.inspect}"
          if user.reset_password_token?
            puts "Password updated successfully"
            render json: { message: "Password updated successfully" }, status: :ok
            user.send_password_change_notification
          else
            puts "Password updated successfully by force: #{user.errors.full_messages}"
            user.send_password_change_notification
            render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
          end
        end
  
        #in this update we set condition that respond base on the def edit it redirect user to frontend
        # and if it doesn't do so user will still be redirected to frontend base on the link set into app/views/devise/resset_password_instructions this will force the user to land on the frontend and udate the password as well
  
  
        def resource_params
          params.require(:user).permit(:password, :password_confirmation, :reset_password_token)
        end
  end
  