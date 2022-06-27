class Category < ApplicationRecord
  belongs_to :user

  has_and_belongs_to_many :expenses, dependent: :destroy
  has_one_attached :icon

  validates :name, presence: true, format: { with: /\A[a-zA-Z]+(?: [a-zA-Z]+)?\z/,
                                             message: 'Invalid category name!',
                                             maximum: 250 }
  validates :icon, presence: true
end
