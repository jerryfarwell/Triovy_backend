class ConfirmationController < Devise::ConfirmationsController
    respond_to :json
  
    def show
      super do |resource|
        redirect_to "http://localhost:5173/confirmation", allow_other_host: true
        return
      end
    end
  end
  
  
  