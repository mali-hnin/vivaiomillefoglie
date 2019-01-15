class PlantsController < ApplicationController
  before_action :set_plant, only: [:show, :edit, :update, :destroy]

  def index
    # offset equals the page we're in, so if we're in the first page
    # offset = 0 * limit, in this case 10, fetching only the first 10 items.
    # Second page, offset = 1 * limit, fetching 10 items after the first 10, etc.
    # thx to http://www.mozartreina.com/pagination-with-rails.html
    @limit = 50
    offset = params[:offset].to_i * @limit ||=0
    @plants = Plant.all.offset(offset).limit(@limit).order('name ASC')
  end

  def by_created
    @limit = 50
    offset = params[:offset].to_i * @limit ||=0
    @plants = Plant.all.offset(offset).limit(@limit).order('created_at DESC')
  end

  def by_updated
    @limit = 50
    offset = params[:offset].to_i * @limit ||=0
    @plants = Plant.all.offset(offset).limit(@limit).order('updated_at DESC')
  end

  def show
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
  end

  def update
    @plant.update(plant_params)
    redirect_to plant_path(@plant)
  end

  def destroy
    @plant.destroy
    redirect_to plants_path
  end

  private

  def set_plant
    @plant = Plant.find(params[:id])
  end

  def plant_params
    params.require(:plant).permit(:name, :description, :category, :esposizione, :fioritura, :altezza, :terreno, :densità, :vaso, :disponibile, :novità, :utile_per, :prezzo, :nascondi, photos: [])
  end
end
