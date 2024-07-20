# spec/db/seeds_spec.rb
require 'rails_helper'

RSpec.describe 'Seed Data' do # rubocop:disable RSpec/DescribeClass
  around do |example|
    ActiveRecord::Base.transaction do
      example.run
      raise ActiveRecord::Rollback
    end
  end

  it 'loads successfully' do
    expect { load Rails.root.join('db/seeds.rb') }.not_to raise_error
  end
end
