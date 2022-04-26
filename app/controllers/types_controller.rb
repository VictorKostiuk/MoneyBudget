# frozen_string_literal: true

class TypesController < ApplicationController
  before_action :set_type!, only: %i[show edit update destroy]

  def index
    @types = Type.all
  end

  def new
    @type = Type.new
  end

  def edit; end

  def show; end

  def create
    @type = Type.new type_params
    if @type.save
      redirect_to type_path(@type), status: :ok
    else
      render :new
    end
  end

  def update
    if @type.update type_params
      redirect_to type_path(@type), status: :ok
    else
      render :edit
    end
  end

  def destroy
    @type.destroy
    redirect_to types_path
  end

  private

  def type_params
    params.require(:type).permit(:name)
  end

  def set_type!
    @type = Type.find params[:id]
  end
end
