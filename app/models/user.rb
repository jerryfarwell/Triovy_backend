class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable,
         :jwt_authenticatable, jwt_revocation_strategy: self



         attribute :session_token, :string     #this allows the user to be logged out into rails console 


 #--------------mailer--------------------------------
after_create :welcome_send

def welcome_send
  UserMailer.user_created(self).deliver_now
end

#------------------------------------------------------


#-----------------password forgotten-------------------

def generate_password_token!
  self.reset_password_token = generate_token
  self.reset_password_sent_at = Time.now.utc
  save!
 end
 
 def password_token_valid?
  (self.reset_password_sent_at + 4.hours) > Time.now.utc
 end
 
 def reset_password!(password)
  self.reset_password_token = nil
  self.password = password
  save!
 end
 
 private
 
 def generate_token
  SecureRandom.hex(10)
 end

 #-----------------------------------------------------

end
