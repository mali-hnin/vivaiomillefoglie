class PiantasController < ApplicationController
  def index
    @piante = Pianta.all
  end

  def show
    @pianta = Pianta.find(params[:id])
  end

  def new

  end

  def create

  end

  def edit

  end

  def update

  end

  def destroy

  end
end
