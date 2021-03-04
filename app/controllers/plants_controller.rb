class PlantsController < ApplicationController
  before_action :set_plant, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except:
    [:index, :show, :erbacee_perenni, :erbacee_annuali, :graminacee, :categoria_altro,
     :esposizione_sole, :esposizione_ombra,
     :fioritura_primavera, :fioritura_estate, :fioritura_autunno, :fioritura_inverno,
     :altezza_bassa, :altezza_media, :altezza_alta,
     :fogliame_ornamentale, :da_taglio, :coprisuolo, :azotofissatrici,
     :insetti_e_uccelli, :da_secco, :spontanee]

    include Pagy::Backend

  def index
    if params[:search] && params[:search].present?
      @pagy, @plants = pagy(Plant.search_plants(params[:search]).alphabetically)
    else
      @pagy, @plants = pagy(Plant.filter(params.slice(:category, :esposizione, :fioritura, :altezza, :funzione)).is_visible.alphabetically)
    end
    respond_to do |format|
      format.html
      format.js
    end
    @line_item = @cart.line_items.new
  end

  def erbacee_perenni
    @category = "erbacee perenni"
    @pagy, @plants = pagy(Plant.filter_by_category(@category).filter(params.slice(:category, :esposizione, :fioritura, :altezza, :funzione)).is_visible.alphabetically)
    respond_to do |format|
      format.html
      format.js
    end
    @line_item = @cart.line_items.new
  end

  def erbacee_annuali
    @category = "erbacee annuali"
    @pagy, @plants = pagy(Plant.filter_by_category(@category).filter(params.slice(:category, :esposizione, :fioritura, :altezza, :funzione)).is_visible.alphabetically)
    respond_to do |format|
      format.html
      format.js
    end
    @line_item = @cart.line_items.new
  end

  def graminacee
    @category = "graminacee"
    @pagy, @plants = pagy(Plant.filter_by_category(@category).filter(params.slice(:category, :esposizione, :fioritura, :altezza, :funzione)).is_visible.alphabetically)
    respond_to do |format|
      format.html
      format.js
    end
    @line_item = @cart.line_items.new
  end

  def categoria_altro
    @category = "altre categorie"
    @pagy, @plants = pagy(Plant.altre_categorie.filter(params.slice(:category, :esposizione, :fioritura, :altezza, :funzione)).is_visible.alphabetically)
    respond_to do |format|
      format.html
      format.js
    end
    @line_item = @cart.line_items.new
  end

  def esposizione_sole
    @esposizione = "sole"
    @pagy, @plants = pagy(Plant.filter_by_esposizione(@esposizione).filter(params.slice(:category, :esposizione, :fioritura, :altezza, :funzione)).is_visible.alphabetically)
    respond_to do |format|
      format.html
      format.js
    end
    @line_item = @cart.line_items.new
  end

  def esposizione_ombra
    @esposizione = "ombra"
    @pagy, @plants = pagy(Plant.filter_by_esposizione(@esposizione).filter(params.slice(:category, :esposizione, :fioritura, :altezza, :funzione)).is_visible.alphabetically)
    respond_to do |format|
      format.html
      format.js
    end
    @line_item = @cart.line_items.new
  end

  def fioritura_primavera
    @fioritura = "primavera"
    @pagy, @plants = pagy(Plant.filter_by_fioritura(@fioritura).filter(params.slice(:category, :esposizione, :fioritura, :altezza, :funzione)).is_visible.alphabetically)
    respond_to do |format|
      format.html
      format.js
    end
    @line_item = @cart.line_items.new
  end

  def fioritura_estate
    @fioritura = "estate"
    @pagy, @plants = pagy(Plant.filter_by_fioritura(@fioritura).filter(params.slice(:category, :esposizione, :fioritura, :altezza, :funzione)).is_visible.alphabetically)
    respond_to do |format|
      format.html
      format.js
    end
    @line_item = @cart.line_items.new
  end

  def fioritura_autunno
    @fioritura = "autunno"
    @pagy, @plants = pagy(Plant.filter_by_fioritura(@fioritura).filter(params.slice(:category, :esposizione, :fioritura, :altezza, :funzione)).is_visible.alphabetically)
    respond_to do |format|
      format.html
      format.js
    end
    @line_item = @cart.line_items.new
  end

  def fioritura_inverno
    @fioritura = "inverno"
    @pagy, @plants = pagy(Plant.filter_by_fioritura(@fioritura).filter(params.slice(:category, :esposizione, :fioritura, :altezza, :funzione)).is_visible.alphabetically)
    respond_to do |format|
      format.html
      format.js
    end
    @line_item = @cart.line_items.new
  end

  def altezza_bassa
    @altezza = "bassa"
    @pagy, @plants = pagy(Plant.filter_by_altezza(@altezza).filter(params.slice(:category, :esposizione, :fioritura, :altezza, :funzione)).is_visible.alphabetically)
    respond_to do |format|
      format.html
      format.js
    end
    @line_item = @cart.line_items.new
  end

  def altezza_media
    @altezza = "media"
    @pagy, @plants = pagy(Plant.filter_by_altezza(@altezza).filter(params.slice(:category, :esposizione, :fioritura, :altezza, :funzione)).is_visible.alphabetically)
    respond_to do |format|
      format.html
      format.js
    end
    @line_item = @cart.line_items.new
  end

  def altezza_alta
    @altezza = "alta"
    @pagy, @plants = pagy(Plant.filter_by_altezza(@altezza).filter(params.slice(:category, :esposizione, :fioritura, :altezza, :funzione)).is_visible.alphabetically)
    respond_to do |format|
      format.html
      format.js
    end
    @line_item = @cart.line_items.new
  end

  def fogliame_ornamentale
    @funzione = "fogliame"
    @funzione_bis = "fogliame decorativo"
    @pagy, @plants = pagy(Plant.filter_by_doppia_funzione(@funzione, @funzione_bis).filter(params.slice(:category, :esposizione, :fioritura, :altezza, :funzione)).is_visible.alphabetically)
    respond_to do |format|
      format.html
      format.js
    end
    @line_item = @cart.line_items.new
  end

  def da_taglio
    @funzione = "taglio"
    @pagy, @plants = pagy(Plant.filter_by_funzione(@funzione).filter(params.slice(:category, :esposizione, :fioritura, :altezza, :funzione)).is_visible.alphabetically)
    respond_to do |format|
      format.html
      format.js
    end
    @line_item = @cart.line_items.new
  end

  def coprisuolo
    @funzione = "coprisuolo"
    @pagy, @plants = pagy(Plant.filter_by_funzione(@funzione).filter(params.slice(:category, :esposizione, :fioritura, :altezza, :funzione)).is_visible.alphabetically)
    respond_to do |format|
      format.html
      format.js
    end
    @line_item = @cart.line_items.new
  end

  def azotofissatrici
    @funzione = "azotofissat"
    @pagy, @plants = pagy(Plant.filter_by_funzione(@funzione).filter(params.slice(:category, :esposizione, :fioritura, :altezza, :funzione)).is_visible.alphabetically)
    respond_to do |format|
      format.html
      format.js
    end
    @line_item = @cart.line_items.new
  end

  def insetti_e_uccelli
    @funzione = "insetti"
    @funzione_bis = "uccelli"
    @pagy, @plants = pagy(Plant.filter_by_doppia_funzione(@funzione, @funzione_bis).filter(params.slice(:category, :esposizione, :fioritura, :altezza, :funzione)).is_visible.alphabetically)
    respond_to do |format|
      format.html
      format.js
    end
    @line_item = @cart.line_items.new
  end

  def da_secco
    @funzione = "secco"
    @pagy, @plants = pagy(Plant.filter_by_funzione(@funzione).filter(params.slice(:category, :esposizione, :fioritura, :altezza, :funzione)).is_visible.alphabetically)
    respond_to do |format|
      format.html
      format.js
    end
    @line_item = @cart.line_items.new
  end

  def spontanee
    @funzione = "spontan"
    @pagy, @plants = pagy(Plant.filter_by_funzione(@funzione).filter(params.slice(:category, :esposizione, :fioritura, :altezza, :funzione)).is_visible.alphabetically)
    respond_to do |format|
      format.html
      format.js
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
