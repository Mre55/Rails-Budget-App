class Category < ApplicationRecord
  belongs_to :user
  has_many :expense_categories, dependent: :destroy
  has_many :expenses, through: :expense_categories, dependent: :destroy

  validates :name, presence: true, length: { minimum: 3 }
end
