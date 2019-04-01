class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2]
  validates_format_of :email, with: /\@casinodemexicali\.com/, message: 'You should use your Casino email to sign in'

   def self.find_for_google_oauth2(auth)
     data = auth.info
     user = User.where(email: data['email']).first
     unless user
       user = User.create(name: data['name'],
           email: data['email'],
           password: Devise.friendly_token[0, 20],
           provider: auth.provider,
           uid: auth.uid
        )
     end
     user.token = auth.credentials.token
     user.refresh_token = auth.credentials.refresh_token
     user.save
     return user
   end
end
