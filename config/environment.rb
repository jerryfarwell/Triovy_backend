# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.smtp_settings = {
    address: "smtp.sendgrid.net",
    port: 587,
    domain: 'http://localhost:3000/',     # this should be replace by the backend link when it is deploy to production
    authentication: "plain",
    enable_starttls_auto: true,
    user_name: "apikey",
    password: Rails.application.credentials.dig(:sendgrid, :api_key)
  }



