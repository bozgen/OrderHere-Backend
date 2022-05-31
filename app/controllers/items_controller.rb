class ItemsController < ApplicationController
  before_action :set_item, only: %i[ show update destroy ]
  before_action :get_shop
  before_action :authenticate_user!, except: [:index, :show]

  # GET /items
  def index
    @items = @shop.items
    render :index
  end

  # GET /shops/1/search?q=shop1
  def search
    @items = @shop.items.where("name LIKE ?", "%"+ params[:q] + "%");
    render :index
  end

  # GET /items/1
  def show
    @item = Item.find_by(shop_id: @shop.id, id: @item.id)
    if @item
      render :show
    else
      @message = "The item or the shop is not found!"
      render json: {message: @message, status: 404}
    end
  end

  # POST /items
  def create
    @item = @shop.items.new(item_params)
    authorize(@item)


    if @item.save
      render :create, status: :created, location: @shop
    else
      render json: @item.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /items/1
  def update
    @item = Item.find_by(shop_id: @shop.id, id: @item.id)
    @item && authorize(@item)
    begin
      if @item.update(item_params)
        render :update
      else
        render json: @item.errors, status: :unprocessable_entity
      end
    rescue
      @message = "The item or the shop is not found!";
      render json: {message: @message, status: 404}
    end
  end

  # DELETE /items/1
  def destroy
    @item = Item.find_by(shop_id: @shop.id, id: @item.id)
    @item && authorize(@item)
    begin
      @item.destroy
      render json: "Item deleted."
    rescue => exception
      @message = "The item or the shop is not found!"
      render json: {message: @message, status: 404}
    end
    
    
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
      params.require(:item).permit(:item_type_id, :shop_id, :name, :description, :price, :quantity)
    end

end
