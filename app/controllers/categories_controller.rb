# frozen_string_literal: true

class CategoriesController < ApplicationController
  before_action :set_category, only: %i[show update edit destroy]

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def edit; end

  def show; end

  def create
    @category = Category.create category_params
    if @category.save
      redirect_to categories_path(@category), status: :ok
    else
      render :new
    end
  end

  def update
    if @category.update category_params
      redirect_to categories_path, status: :ok
    else
      render :edit
    end
  end

  def destroy
    @category.destroy
    redirect_to account_path(@category)
  end

  private

  def category_params
    params.require(:category).permit(:name, :description)
  end

  def set_category
    @category = Category.find params[:id]
  end
end
