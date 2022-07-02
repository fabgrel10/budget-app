require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:user) { User.create(name: 'John Doe', email: 'john_doe@mail.com', password: '123456') }
  let(:category) { Category.create(name: 'Shopping', user_id: user.id, icon: Rack::Test::UploadedFile.new('spec/example.jpeg', 'image/jpg')) }

  describe 'Validations' do
    context 'when valid' do
      it { expect(category).to be_valid }
    end

    it 'should allow valid name' do
      category.name = 'John Doe'
      expect(category).to be_valid
    end

    it 'should allow valid author_id' do
      category.user_id = nil
      expect(category).to_not be_valid
    end
  end
end
