class ItemsController < ApplicationController
  before_action :set_item, only: %i[ show update destroy ]

  # GET /items
  def index
    @items = Item.all
    render :index
  end

  # GET /items/1
  def show
    render :show
  end

  # POST /items
  def create
    @item = Item.new(item_params)

    if @item.save
      render :create, status: :created, location: @item
    else
      render json: @item.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /items/1
  def update
    if @item.update(item_params)
      render :update
    else
      render json: @item.errors, status: :unprocessable_entity
    end
  end

  # DELETE /items/1
  def destroy
    @item.destroy
    render json: "Item deleted."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def item_params
      params.require(:item).permit(:item_type_id, :shop_id, :name, :description, :price)
    end
end
