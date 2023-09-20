# app/services/sms_service.rb

require 'twilio-ruby'

class SmsService
  def initialize(quote)
    @quote = quote
    @account_sid = Rails.application.credentials.dig(:twilio, :account_sid)
    @auth_token = Rails.application.credentials.dig(:twilio, :auth_token)
  end

  def send_quote_sms
    @client = Twilio::REST::Client.new(@account_sid, @auth_token)
  
    message_body = "New Quote:\n"
    @quote.attributes.each do |attr, value|
      message_body << "#{attr}: #{value}\n"
    end

    message = @client.messages.create(
      body: message_body,
      from: '+17242046854',
      to: '+33753226897'
    )

    puts "Your quote has been sent "
    puts message.sid
  end
end
