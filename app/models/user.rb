class User < ApplicationRecord
  devise :omniauthable, omniauth_providers: [:okta]

  def self.from_omniauth(auth)
    user = User.find_or_create_by(email: auth['info']['email']) do |user|
      user.provider = auth['provider']
      user.uid = auth['uid']
      user.email = auth['info']['email']
    end
  end
end
