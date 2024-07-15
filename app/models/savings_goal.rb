class SavingsGoal < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :target_amount, presence: true, numericality: { greater_than: 0 }
  validates :current_amount, numericality: { greater_than_or_equal_to: 0 }
  validates :end_date, presence: true
end
