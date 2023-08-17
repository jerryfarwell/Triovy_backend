class UserMailer < ApplicationMailer
    def user_created(user)
        @user = user
        @url  = 'www.triovy.com' 
        mail(
          from: "triovy1@gmail.com",
           to: @user.email,
           subject: "Bienvenue sur Triovy" 
         )
      end

end
