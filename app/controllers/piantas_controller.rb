class PiantasController < ApplicationController
  def index
    @piante = Pianta.all
  end

  def show
    @pianta = Pianta.find(params[:id])
  end

  def new
    @pianta = Pianta.new
  end

  def create
    @pianta = Pianta.new(pianta_params)
    if @pianta.save
      redirect_to pianta_path(@pianta)
    else
      render :new
    end
  end

  def edit

  end

  def update

  end

  def destroy

  end

  private

  def pianta_params
    params.require(:pianta).permit(:name, :photo, :description, :category, :esposizione, :fioritura, :altezza, :terreno, :densità, :vaso, :disponibilità, :novità, :utile_per)
  end
end
