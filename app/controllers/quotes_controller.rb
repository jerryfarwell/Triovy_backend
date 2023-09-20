class QuotesController < ApplicationController
  def index
    @quote = Quote.all
  end

  def new
    @quote = Quote.new
  end

  def edit
    @quote = Quote.new
  end

  def create
    @quote = Quote.new(quote_params)
    if @quote.save
      QuoteMailer.send_quote(@quote).deliver_now
      #redirect_to root_path, success: "Your message has been sent successfully"
      puts "Your quote has been sent successfully"
    else
      #flash.now[:error] = "Failed to send message"
      puts "Failed to send quote"
      render :new
    end
  end

  private

  def quote_params
    params.require(:quote).permit(:first_name, :user_city, :user_number, :user_email, :selectedOption, :textArea)
  end



#------------------------- this is set for twilio --------------------------------------------------------------

def send_quote_sms(quote)
  # Initialize Twilio client
  account_sid = Rails.application.credentials.dig(:twilio, :account_sid)
  auth_token = Rails.application.credentials.dig(:twilio, :auth_token)
  @client = Twilio::REST::Client.new(account_sid, auth_token)

  # Compose the SMS message
  body = "New quote received from #{quote.user_email}: #{quote.textArea}"

  # Replace with your Twilio phone number
  from_phone = '+17242046854'

  # Replace with your phone number to receive the SMS
  to_phone = '+33753226897'

  # Send the SMS
  @client.messages.create(
    body: body,
    from: from_phone,
    to: to_phone
  )

  puts "SMS sent successfully to #{to_phone}: #{body}"
end


end
