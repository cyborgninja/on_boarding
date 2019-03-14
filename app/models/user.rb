class User < ApplicationRecord
  has_many :blogs, dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  mount_uploader :image, ImagesUploader

  extend Enumerize

  enumerize :sex, in: [:male, :female]
  enumerize :role, in: {:normal => 1, :admin => 2}

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, :confirmable

   def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
     user = User.where(:provider => auth.provider, :uid => auth.uid).first
     unless user
       user = User.create(name:     auth.extra.raw_info.name,
                          provider: auth.provider,
                          uid:      auth.uid,
                          email:    auth.info.email,
                          password: Devise.friendly_token[0,20]
                         )
     end
     user
   end

   def self.find_for_google_oauth2(auth)
     user = User.where(email: auth.info.email).first

     unless user
       user = User.create(name:     auth.info.name,
                          provider: auth.provider,
                          uid:      auth.uid,
                          email:    auth.info.email,
                          token:    auth.credentials.token,
                          password: Devise.friendly_token[0, 20])
     end
     user
   end
end
