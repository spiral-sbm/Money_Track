class BankAccount < ApplicationRecord
  belongs_to :user
  has_many :transactions

  after_initialize :set_default_balance, if: :new_record?

  private

  def set_default_balance
    self.balance ||= 0.0
  end
end
