class LineItemsController < ApplicationController
  include CurrentCart
  before_action :set_plant, only: [:show, :edit, :update]
  before_action :set_line_item, only: [:show, :edit, :update, :destroy]
  before_action :set_cart, only: [:create, :destroy]

  # GET /line_items
  # GET /line_items.json
  def index
    @line_items = LineItem.all
  end

  # GET /line_items/1
  # GET /line_items/1.json
  def show
  end

  # GET /line_items/new
  def new
    @line_item = LineItem.new
  end

  # GET /line_items/1/edit
  def edit
  end

  # POST /line_items
  # POST /line_items.json
  # NEED TO FIND WAY TO GET REUSABLE PLANT ID

  def create
    @cart = current_cart
    @temp_line_item = @cart.line_items.new(line_item_params)
    plant = Plant.find(@temp_line_item.plant_id)
    existing_item = @cart.line_items.find_by(plant_id: plant.id)
    if existing_item
      #update
      @line_item = existing_item
      new_quantity = @line_item.quantity + @temp_line_item.quantity
      @line_item.update(quantity: new_quantity)
      @temp_line_item.destroy
    else
      @line_item = @temp_line_item
    end
    @cart.save
    session[:cart_id] = @cart.id
    respond_to do |format|
      format.html
      format.js
    end
  end

  # PATCH/PUT /line_items/1
  # PATCH/PUT /line_items/1.json
  def update
    respond_to do |format|
      if @line_item.update(line_item_params)
        format.html { redirect_to @line_item }
        format.json { render :show, status: :ok, location: @line_item }
      else
        format.html { render :edit }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /line_items/1
  # DELETE /line_items/1.json
  def destroy
    @line_item.destroy
    redirect_to cart_path(@cart)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_line_item
      @line_item = LineItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the whitelist through.
    def line_item_params
      params.require(:line_item).permit(:plant_id, :quantity)
    end

    def current_plant
      @line_item = set_line_item
      Plant.find(@line_item.plant_id)
    end
end
