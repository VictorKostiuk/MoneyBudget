# frozen_string_literal: true

class ChecksController < ApplicationController
  before_action :set_check, only: %i[show edit update destroy]
  def index
    @checks = Check.all
  end

  def new
    @check = Check.new
  end

  def edit; end

  def show; end

  def create
    @check = Check.create check_params
    if @check.save
      redirect_to check_path(@check), status: :ok
    else
      render :new
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
    redirect_to checks_path, status: :no_content
  end

  private

  def check_params
    params.require(:check).permit(:title, :body, :cost, :total_sum_id)
  end

  def set_check
    @check = Check.find params[:id]
  end
end
