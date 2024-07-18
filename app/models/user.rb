require 'devise'
# backend/app/models/user.rb
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :organization_staff, class_name: 'Organization::Staff', dependent: :destroy
  has_many :organizations, through: :organization_staff

  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true
  validates :pronouns, length: { maximum: 50 }, allow_blank: true

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.username = auth.info.name
      user.avatar = auth.info.image
    end
  end
end
