class ItemsController < ApplicationController
  before_action :set_item, only: %i[ show update destroy ]
  before_action :get_shop

  # GET /items
  def index
    @items = @shop.items
    render :index
  end

  # GET /items/1
  def show
    @item = Item.find_by(shop_id: @shop.id, id: @item.id)
    if @item
      render :show
    else
      render json: "No such item on this shop!"
    end
  end

  # POST /items
  def create
    @item = @shop.items.new(item_params)

    if @item.save
      render :create, status: :created, location: @shop
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

    def get_shop
      @shop = Shop.find(params[:shop_id])
    end

    # Only allow a list of trusted parameters through.
    def item_params
      params.require(:item).permit(:item_type_id, :shop_id, :name, :description, :price)
    end

end
