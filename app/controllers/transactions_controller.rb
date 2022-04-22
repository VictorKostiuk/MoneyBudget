# frozen_string_literal: true

class TransactionsController < ApplicationController
  before_action :set_transaction, only: %i[show edit update destroy]
  before_action :set_account, only: %i[create destroy]

  def index
    @transactions = Transaction.all
  end

  def edit; end

  def show; end

  def create
    @transaction = @account.transactions.build(transaction_params.merge(user_id: current_user.id))

    if @transaction.save
      redirect_to account_path(@account), status: :ok
    else
      render 'accounts/show'
    end
  end

  def update
    if @transaction.update transaction_params
      redirect_back fallback_location: root_path, status: :ok
    else
      render :edit
    end
  end

  def destroy
    @transaction.destroy
    redirect_to account_path(@account)
  end

  private

  def transaction_params
    params.require(:transaction).permit(:title, :body, :cost, :account_id, :image, :category_id)
  end

  def set_transaction
    @transaction = Transaction.find params[:id]
  end

  def set_account
    @account = Account.find params[:account_id]
  end

end
