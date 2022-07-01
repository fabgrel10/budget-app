class Expense < ApplicationRecord
  belongs_to :user
  has_many :category_expenses, class_name: 'CategoryExpense', dependent: :destroy

  validates :name, presence: true, format: { with: /\A[a-zA-Z]+(?: [a-zA-Z]+)?\z/,
                                             message: 'Invalid category name!',
                                             maximum: 250 }
  validates :amount, numericality: { only_decimal: true, greater_than: 0 }
end
