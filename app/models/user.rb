require 'devise'
# backend/app/models/user.rb
class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher
  extend FriendlyId
  friendly_id :username, use: :slugged

  validates :email, presence: true, uniqueness: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :password, presence: true, length: { minimum: 8 }
  validates :username, presence: true, uniqueness: true
  validates :pronouns, length: { maximum: 50 }, allow_blank: true
  validates :first_name, length: { maximum: 50 }, presence: true
  validates :last_name, length: { maximum: 50 }, presence: true

  # Include default devise modules. Others available are:
  #
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         #  :confirmable, :lockable, :timeoutable, :trackable, :omniauthable,
         :jwt_authenticatable, jwt_revocation_strategy: self

  has_one :owned_organization, class_name: 'Organization::Organization', foreign_key: 'owner_id', dependent: :destroy, inverse_of: :owner

  has_many :organization_staff_members, class_name: 'Organization::StaffMember', dependent: :destroy
  has_many :staff, through: :organization_staff_members, source: :user
  # def self.from_omniauth(auth)
  #   where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
  #     user.email = auth.info.email
  #     user.username = auth.info.name
  #     user.avatar = auth.info.image
  #   end
  # end
end
