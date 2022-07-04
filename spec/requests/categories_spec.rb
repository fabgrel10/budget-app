require 'rails_helper'

RSpec.describe 'Categories', type: :request do
  include Devise::Test::IntegrationHelpers

  let(:user) { User.create(name: 'John Doe', email: 'john_doe@mail.com', password: '123456') }
  let(:category) do
    Category.create(name: 'Shopping', user_id: user.id,
                    icon: Rack::Test::UploadedFile.new('spec/example.jpeg', 'image/jpg'))
  end

  describe 'GET /index' do
    before do
      sign_in user
      get categories_path
    end

    it 'response to html' do
      expect(response.content_type).to include 'text/html'
    end
  end

  describe 'GET /new' do
    before do
      sign_in user
      get new_category_path
    end

    it 'responds to html' do
      expect(response.content_type).to include 'text/html'
    end
  end
end
