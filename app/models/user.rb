require 'devise'
# backend/app/models/user.rb
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # has_many :organizers
  # has_many :organizer_staffs
  # has_many :events, through: :organizers
  # has_many :staffed_organizers, through: :organizer_staffs, source: :organizer

  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.username = auth.info.name
      user.avatar = auth.info.image
    end
  end
end
