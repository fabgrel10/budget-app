class Category < ApplicationRecord
  belongs_to :user

  has_many :category_expenses, class_name: 'CategoryExpense', dependent: :destroy
  has_one_attached :icon

  validates :name, presence: true, format: { with: /\A[a-zA-Z]+(?: [a-zA-Z]+)?\z/,
                                             message: 'Invalid category name!',
                                             maximum: 250 }
  validates :icon, presence: true

  def category_thumbnail
    icon.variant(resize: '70x70').processed
  end

  def total_amount
    expenses = category_expenses.includes([:expense])
    total = 0
    expenses.each do |expense|
      total += expense.expense.amount
    end
    total
  end
end
