require 'devise'
# backend/app/models/user.rb
class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher
  extend FriendlyId
  friendly_id :username, use: :slugged
  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true
  validates :pronouns, length: { maximum: 50 }, allow_blank: true

  # Include default devise modules. Others available are:
  #
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         #  :confirmable, :lockable, :timeoutable, :trackable, :omniauthable,
         :jwt_authenticatable, jwt_revocation_strategy: self

  has_many :organization_staff, class_name: 'Organization::Staff', dependent: :destroy
  has_many :organizations, through: :organization_staff

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.username = auth.info.name
      user.avatar = auth.info.image
    end
  end
end
