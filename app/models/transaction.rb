class Transaction < ApplicationRecord
  belongs_to :category
  belongs_to :bank_account
  belongs_to :user

  after_save :update_bank_account_balance

  private

  def update_bank_account_balance
    bank_account.update(balance: bank_account.balance + amount)
  end
end
