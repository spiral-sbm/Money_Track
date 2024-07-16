class User < ApplicationRecord
  has_many :categories
  has_many :bank_accounts
  has_many :transactions
  has_many :savings_goals
  has_many :budgets
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
