#frozen_string_literal: true

class TotalSumsController < ApplicationController
  before_action :set_total_sum, only: %i[show edit update destroy]

  def index
    @total_sums = TotalSum.all
  end

  def new
    @total_sum = TotalSum.new
  end

  def edit; end

  def show; end

  def create
    @total_sum = TotalSum.build total_sum_params

    if @total_sum.save
      redirect_to
    else
      render :new
    end
  end

  def update
    if @total_sum.update total_sum_params
      redirect_to
    else
      render :edit
    end
  end

  def destroy
    @total_sum.destroy
    redirect_to
  end

  private

  def total_sum_params
    params.require(:total_sum).permit(:title, :for_what, :count, :check_id)
  end

  def set_total_sum
    @total_sum = TotalSum.find params[:id]
  end
end
