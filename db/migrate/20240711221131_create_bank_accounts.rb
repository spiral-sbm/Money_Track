class CreateBankAccounts < ActiveRecord::Migration[7.1]
  def change
    create_table :bank_accounts do |t|
      t.references :user, null: false, foreign_key: true
      t.string :bank_name
      t.string :account_type
      t.decimal :balance, precision: 10, scale: 2
      
      t.timestamps
    end
  end
end
