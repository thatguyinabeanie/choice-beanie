# frozen_string_literal: true

# backend/app/models/user.rb
class User < ApplicationRecord
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.username = auth.info.name
      user.avatar = auth.info.image
    end
  end
end
