class Expense < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :categories

  validates :name, presence: true, format: { with: /\A[a-zA-Z]+(?: [a-zA-Z]+)?\z/,
                                             message: 'Invalid category name!',
                                             maximum: 250 }
  validates :amount, numericality: { only_decimal: true, greater_than: 0 }
end
