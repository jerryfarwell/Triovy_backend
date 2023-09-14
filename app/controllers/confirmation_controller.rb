class ConfirmationController < Devise::ConfirmationsController
    respond_to :json
  
    def show
      super do |resource|
        redirect_to "https://www.triovy.com/confirmation", allow_other_host: true
        return
      end
    end
  end
  
  
  