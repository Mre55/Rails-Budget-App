class User < ApplicationRecord
  after_create :set_role

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :categories, dependent: :destroy
  has_many :expenses, dependent: :destroy

  validates :name, presence: true

  private

  def set_role
    update(role: 'user')
  end
end
