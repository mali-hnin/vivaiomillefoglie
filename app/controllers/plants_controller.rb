class PlantsController < ApplicationController
  before_action :set_plant, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  include Pagy::Backend

  def index
    # offset equals the page we're in, so if we're in the first page
    # offset = 0 * limit, in this case 10, fetching only the first 10 items.
    # Second page, offset = 1 * limit, fetching 10 items after the first 10, etc.
    # thx to http://www.mozartreina.com/pagination-with-rails.html
    if params[:category]
      @pagy, @plants = pagy(Plant.where("category ILIKE :category", category: '%'+params[:category]+'%').order('name ASC'), items: 12)
    elsif params[:esposizione]
      @pagy, @plants = pagy(Plant.where("esposizione ILIKE :esposizione", esposizione: params[:esposizione]+'%').order('name ASC'), items: 12)
    elsif params[:fioritura]
      @pagy, @plants = pagy(Plant.where("fioritura ILIKE :fioritura", fioritura: '%'+params[:fioritura]+'%').order('name ASC'), items: 12)
    elsif params[:altezza]
      @pagy, @plants = pagy(Plant.where("altezza ILIKE :altezza", altezza: '%'+params[:altezza]+'%').order('name ASC'), items: 12)
    elsif params[:terreno]
      @pagy, @plants = pagy(Plant.where("terreno ILIKE :terreno", terreno: '%'+params[:terreno]+'%').order('name ASC'), items: 12)
    elsif params[:utile_per]
      @pagy, @plants = pagy(Plant.where("utile_per ILIKE :utile_per OR utile_per ILIKE :utile_per2", utile_per: '%'+params[:utile_per]+'%', utile_per2: '%'+params[:utile_per2]+'%').order('name ASC'), items: 12, items: 12)
    else
      @pagy, @plants = pagy(Plant.all.order('name ASC'), items: 12)
    end
    @line_item = @cart.line_items.new
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
