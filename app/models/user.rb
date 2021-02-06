class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid)
        .first_or_initialize.tap do |user|
      user.update!(provider: auth.provider,
                   uid: auth.uid,
                   evernote_token: auth.credentials.token)
    end
  end
end
