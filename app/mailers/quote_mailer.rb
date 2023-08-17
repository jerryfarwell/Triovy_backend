class QuoteMailer < ApplicationMailer
    def send_quote(quote_params)
        @quote_params = quote_params
        mail(
          from: "triovy1@gmail.com",
          to: "triovy1@gmail.com",
          subject: 'New quote requirement'
        )
      end
  
end
