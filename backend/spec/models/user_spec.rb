require 'rails_helper'
require_relative '../../app/models/concerns/secure_password'

RSpec.describe User do
  describe 'validations' do
    let(:first_name) { 'John' }
    let(:last_name) { 'Doe' }
    let(:pronouns) { 'he/him' }
    let(:email) { 'fuecoco@example.com' }
    let(:username) { 'fuecoco_number_1' }
    let(:password) { SecurePassword.generate_secure_password }
    let(:password_confirmation) { password }

    it 'is valid with valid attributes' do
      user = described_class.new(username:, email:, pronouns:, first_name:, last_name:, password:,
                                 password_confirmation:)
      expect(user).to be_valid
    end

    it 'is not valid without a first name' do
      user = described_class.new(username:, email:, pronouns:, last_name:, password:, password_confirmation:)
      expect(user).not_to be_valid
    end

    it 'is not valid without a last name' do
      user = described_class.new(username:, email:, pronouns:, first_name:, password:, password_confirmation:)
      expect(user).not_to be_valid
    end

    it 'is not valid without an email' do
      user = described_class.new(username:, pronouns:, first_name:, last_name:, password:, password_confirmation:)
      expect(user).not_to be_valid
    end

    it 'is not valid without a username' do
      user = described_class.new(email:, pronouns:, first_name:, last_name:, password:, password_confirmation:)
      expect(user).not_to be_valid
    end
  end
end
