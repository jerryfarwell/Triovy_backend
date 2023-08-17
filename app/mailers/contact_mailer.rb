class ContactMailer < ApplicationMailer
    def send_email(contact_params)
      @contact_params = contact_params
      mail(
        from: "triovy1@gmail.com",
        to: "triovy1@gmail.com",
        #to: @contact_params.email, # Specify your email address here 
        subject: 'New contact message'
      )
    end
  end
  