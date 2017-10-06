class PlantsController < ApplicationController
  def index
    @plants = Plant.all
  end

  def show
    @plant = Plant.find(params[:id])
  end

  def new
    @plant = Plant.new
  end

  def create
    @plant = Plant.new(plant_params)
    if @plant.save
      redirect_to plant_path(@plant)
    else
      render :new
    end
  end

  def edit
    @plant = Plant.find(params[:id])
  end

  def update

  end

  def destroy
    @plant = Plant.find(params[:id])
    @plant.destroy
  end

  private

  def pianta_params
    params.require(:plant).permit(:name, :photo, :description, :category, :esposizione, :fioritura, :altezza, :terreno, :densità, :vaso, :disponibile, :novità, :utile_per)
  end
end
