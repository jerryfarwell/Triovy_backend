class ContactsController < ApplicationController
  def index
    @cantact = Contact.all
  end

  def new
    @contact = Contact.new
  end

  def edit
    @contact = Contact.new
  end

  def update
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      ContactMailer.send_email(@contact).deliver_now
      #redirect_to root_path, success: "Your message has been sent successfully"
      puts "Your message has been sent successfully"
    else
      #flash.now[:error] = "Failed to send message"
      puts "Failed to send message"
      render :new
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:email, :name, :subject, :content)
  end
end
