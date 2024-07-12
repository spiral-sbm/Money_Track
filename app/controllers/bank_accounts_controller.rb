class BankAccountsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_bank_account, only: [:show, :edit, :update, :destroy]
  
    def index
      @bank_accounts = current_user.bank_accounts
    end
  
    def show
    end
  
    def new
      @bank_account = BankAccount.new
    end
  
    def create
      @bank_account = current_user.bank_accounts.build(bank_account_params)
      if @bank_account.save
        redirect_to authenticated_root_path, notice: 'Bank account was successfully created.'
      else
        render :new
      end
    end
  
    def edit
    end
  
    def update
      if @bank_account.update(bank_account_params)
        redirect_to authenticated_root_path, notice: 'Bank account was successfully updated.'
      else
        render :edit
      end
    end
  
    def destroy
      @bank_account.destroy
      redirect_to authenticated_root_path, notice: 'Bank account was successfully destroyed.'
    end
  
    private
  
    def set_bank_account
      @bank_account = current_user.bank_accounts.find(params[:id])
    end
  
    def bank_account_params
      params.require(:bank_account).permit(:bank_name, :account_type, :balance)
    end
end
  