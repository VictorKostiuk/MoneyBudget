# frozen_string_literal: true

class ChecksController < ApplicationController
  before_action :set_check, only: %i[show edit update destroy]
  before_action :set_total_sum, only: %i[create destroy]

  def index
    @checks = Check.all
  end

  def edit; end

  def show; end

  def create
    @check = @total_sum.checks.build check_params
    if @check.save
      redirect_to total_sum_path(@total_sum), status: :ok
    else
      render 'total_sums/show'
    end
  end

  def update
    if @check.update check_params
      redirect_to check_path(@check), status: :ok
    else
      render :edit
    end
  end

  def destroy
    @check.destroy
    redirect_to total_sum_path(@total_sum)
  end

  private

  def check_params
    params.require(:check).permit(:title, :body, :cost, :total_sum_id)
  end

  def set_check
    @check = Check.find params[:id]
  end

  def set_total_sum
    @total_sum = TotalSum.find params[:total_sum_id]
  end
end
