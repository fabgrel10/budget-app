require 'rails_helper'

RSpec.describe Expense, type: :model do
  describe 'Test validations' do
    let(:user) { User.create(name: 'John Doe', email: 'john_doe@mail.com', password: '123456') }
    let(:category) do
      Category.create(name: 'Shopping', user_id: user.id,
                      icon: Rack::Test::UploadedFile.new('spec/example.jpeg', 'image/jpg'))
    end
    let(:expense) { described_class.create(name: 'Suit', amount: 12, user:) }
    let(:category_expense) { CategoryExpense.create(category_id: category.id, expense_id: expense.id) }

    describe 'Validations' do
      context 'when valid' do
        it { expect(expense).to be_valid }
      end

      it 'valid expense_category' do
        expect(category_expense).to be_valid
      end

      it 'valids name' do
        expense.name = nil
        expect(expense).not_to be_valid
      end

      it 'valids amount' do
        expense.amount = -10
        expect(expense).not_to be_valid
      end

      it 'valids amount' do
        expense.amount = 10
        expect(expense).to be_valid
      end
    end
  end
end
