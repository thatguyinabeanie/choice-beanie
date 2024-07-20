require 'rails_helper'

RSpec.describe User do
  describe 'validations' do
    it 'is valid with valid attributes' do
      user = described_class.new(username: 'fuecoco_number_1', email: 'fuecoco@example.com', pronouns: 'he/him', first_name: 'John', last_name: 'Doe', password: '12345678',
                                 password_confirmation: '12345678')
      expect(user).to be_valid
    end

    it 'is not valid without a first name' do
      user = described_class.new(username: 'fuecoco_number_1', email: 'fuecoco@example.com', pronouns: 'he/him', last_name: 'Doe', password: '12345678', password_confirmation: '12345678')
      expect(user).not_to be_valid
    end

    it 'is not valid without a last name' do
      user = described_class.new(username: 'fuecoco_number_1', email: 'fuecoco@example.com', pronouns: 'he/him', first_name: 'John', password: '12345678', password_confirmation: '12345678')
      expect(user).not_to be_valid
    end

    it 'is not valid without an email' do
      user = described_class.new(username: 'fuecoco_number_1', pronouns: 'he/him', first_name: 'John', last_name: 'Doe', password: '12345678', password_confirmation: '12345678')
      expect(user).not_to be_valid
    end

    it 'is not valid without a username' do
      user = described_class.new(email: 'fuecoco@example.com', pronouns: 'he/him', first_name: 'John', last_name: 'Doe', password: '12345678', password_confirmation: '12345678')
      expect(user).not_to be_valid
    end
  end
end
