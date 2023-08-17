class UsersController < ApplicationController
  respond_to :json

  def index
    @users = User.all
    render json: { users: @users }
  end
  
  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def show
    @user = User.find(params[:id])
    render json: { user: @user }
  end


 # def success
  #  puts 'this user has successfully completed the payment'
   # @user = User.find(params[:id])
    # render json: { user: @user }
    # UserMailer.user_paid(@user).deliver_now
    #puts 'the payement was succesfully completed'
  #end

  
end
