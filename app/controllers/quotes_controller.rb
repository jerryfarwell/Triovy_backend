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
      @client.messages.body
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



end
