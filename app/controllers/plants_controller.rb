class PlantsController < ApplicationController
  before_action :set_plant, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  include Pagy::Backend

  def index
    if params[:search] && params[:search].present?
      @pagy, @plants = pagy(Plant.search_plants(params[:search]).alphabetically)
    elsif params[:category]
      @pagy, @plants = pagy(Plant.where("category ILIKE :category", category: '%'+params[:category]+'%').alphabetically)
    elsif params[:esposizione]
      @pagy, @plants = pagy(Plant.where("esposizione ILIKE :esposizione", esposizione: params[:esposizione]+'%').alphabetically)
    elsif params[:fioritura]
      @pagy, @plants = pagy(Plant.where("fioritura ILIKE :fioritura", fioritura: '%'+params[:fioritura]+'%').alphabetically)
    elsif params[:altezza]
      @pagy, @plants = pagy(Plant.where("altezza ILIKE :altezza", altezza: '%'+params[:altezza]+'%').alphabetically)
    elsif params[:terreno]
      @pagy, @plants = pagy(Plant.where("terreno ILIKE :terreno", terreno: '%'+params[:terreno]+'%').alphabetically)
    elsif params[:utile_per]
      @pagy, @plants = pagy(Plant.where("utile_per ILIKE :utile_per OR utile_per ILIKE :utile_per2", utile_per: '%'+params[:utile_per]+'%', utile_per2: '%'+params[:utile_per2]+'%').alphabetically)
    else
      @pagy, @plants = pagy(Plant.all.alphabetically)
    end

    @line_item = @cart.line_items.new
  end

  def export
    @plants = Plant.all.alphabetically
    respond_to do |format|
      format.xlsx {
        response.headers['Content-Disposition'] = 'filename="catalogo_vivaio.xlsx"'
      }
      format.csv { send_data @plants.to_csv, filename: "catalogo_vivaio_#{Date.today}.csv" }
    end
  end

  def admin_catalogo
    @pagy, @plants = pagy(Plant.all.alphabetically, items: 50)
  end

  def by_created
    @pagy, @plants = pagy(Plant.all.recently_created, items: 50)
  end

  def by_updated
    @pagy, @plants = pagy(Plant.all.recently_updated, items: 50)
  end

  def show
    @line_item = @cart.line_items.new
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
