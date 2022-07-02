require 'rails_helper'

RSpec.describe 'Expenses', type: :request do
  include Devise::Test::IntegrationHelpers

  let(:user) { User.create(name: 'John Doe', email: 'john_doe@mail.com', password: '123456') }
  let(:category) { Category.create(name: 'Shopping', user_id: user.id, icon: Rack::Test::UploadedFile.new('spec/example.jpeg', 'image/jpg')) }

  describe 'GET /index' do
    before do
      sign_in user
      get category_path(category.id)
    end
  end
end
