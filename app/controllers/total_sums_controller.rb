# frozen_string_literal: true

class TotalSumsController < ApplicationController
  before_action :set_total_sum!, only: %i[show edit update destroy]

  def index
    @total_sums = TotalSum.all
  end

  def new
    @total_sum = TotalSum.new
  end

  def edit; end

  def show
    @check = @total_sum.checks.build
  end

  def create
    @total_sum = TotalSum.create total_sum_params
    if @total_sum.save
      redirect_to total_sums_path(@total_sum), status: :ok
    else
      render :new
    end
  end

  def update
    if @total_sum.update total_sum_params
      redirect_to total_sums_path(@total_sum), status: :ok
    else
      render :edit
    end
  end

  def destroy
    @total_sum.destroy
    redirect_to total_sums_path, status: :no_content
  end

  private

  def total_sum_params
    params.require(:total_sum).permit(:title, :for_what, :count, :checks_id)
  end

  def set_total_sum!
    @total_sum = TotalSum.find params[:id]
  end
end
