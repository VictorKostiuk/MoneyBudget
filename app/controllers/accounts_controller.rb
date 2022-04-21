# frozen_string_literal: true

class AccountsController < ApplicationController
  before_action :set_total_sum!, only: %i[show edit update destroy]

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
    @account = Account.create(total_sum_params.merge(user_id: current_user))
    if @account.save
      redirect_to accounts_path(@account), status: :ok
    else
      render :new
    end
  end

  def update
    if @account.update total_sum_params
      redirect_to account_path(@account), status: :ok
    else
      render :edit
    end
  end

  def destroy
    @account.destroy
    redirect_to accounts_path
  end

  private

  def total_sum_params
    params.require(:account).permit(:title, :for_what, :total_count)
  end

  def set_total_sum!
    @account = Account.find params[:id]
  end
end
