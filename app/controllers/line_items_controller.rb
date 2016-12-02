class LineItemsController < ApplicationController
  before_action :set_line_item, only: [:show, :edit, :update, :destroy]
  before_action :set_sale, only: [:create, :index]

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
  def create
    dish = Dish.find(params[:line_item][:dish_id])
    @line_item = @sale.line_items.find_by(dish_id: params[:line_item][:dish_id])
    @line_item.quantity = @line_item.quantity + 1 if @line_item

    @line_item = @sale.line_items.new unless @line_item
    @line_item.set_price(dish.price)



    respond_to do |format|
      if @line_item.save
        @cart_items = @sale.line_items.all
        format.html { redirect_to @line_item, notice: 'Line item was successfully created.' }
        format.json { render :show, status: :created }
        format.js
      else
        format.html { render :new }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /line_items/1
  # PATCH/PUT /line_items/1.json
  def update
    respond_to do |format|
      if @line_item.update(line_item_params)
        format.html { redirect_to @line_item, notice: 'Line item was successfully updated.' }
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
    respond_to do |format|
      format.html { redirect_to line_items_url, notice: 'Line item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_line_item
      @line_item = LineItem.find(params[:id])
    end

    def set_sale()
      @sale = Sale.find(params[:sale_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def line_item_params
      params.require(:line_item).permit(:dish_id)
    end
end
