# frozen_string_literal: true

class AccountsController < ApplicationController
  before_action :set_account!, only: %i[show edit update destroy]

  def index
    @accounts = Account.all
  end

  def new
    @account = Account.new
  end

  def edit; end

  def show
    @transaction = @account.transactions.build
  end

  def create
    @account = current_user.accounts.build account_params
    if @account.save
      redirect_to account_path(@account)
    else
      render :new
    end
  end

  def update
    if @account.update account_params
      redirect_to account_path(@account)
    else
      render :edit
    end
  end

  def destroy
    @account.destroy
    redirect_to account_path(@account)
  end

  private

  def account_params
    params.require(:account).permit(:title, :for_what, :total_count)
  end

  def set_account!
    @account = Account.find params[:id]
  end
end
