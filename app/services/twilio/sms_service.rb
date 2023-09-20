
# # app/services/twilio/sms_service.rb
# require 'twilio-ruby'

# class SmsService
#     account_sid = Rails.application.credentials.dig(:twilio, :account_sid)
#     auth_token = Rails.application.credentials.dig(:twilio, :auth_token)

#     @client = Twilio::REST::Client.new(account_sid, auth_token)
    
#     message = @client.messages.create(
#       body: 'this is the message from my app',
#       from: '+17242046854',
#       to: '+33753226897'
#     )
    
#     puts message.sid 
# end

