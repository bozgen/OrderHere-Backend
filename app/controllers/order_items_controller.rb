class OrderItemsController < ApplicationController
  before_action :set_order_item, only: %i[ show update destroy ]
  before_action :get_table
  before_action :get_shop, only: :create

  # GET /order_items
  def index
    @order_items = @table.order_items
    render :index
  end

  # POST /order_items
  def create
    @order_item = @table.order_items.new(order_item_params)

    if @order_item.save
      render :create, status: :created, location: @shop
    else
      render json: @order_item.errors, status: :unprocessable_entity
    end
  end

  # DELETE /order_items/1
  def destroy
    @order_item.destroy
    render json: "Order item deleted."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order_item
      @order_item = OrderItem.find(params[:id])
    end

    def get_table
      @table = Table.find(params[:table_id])
    end 

    def get_shop
      @shop = Shop.find(params[:shop_id])
    end

    # Only allow a list of trusted parameters through.
    def order_item_params
      params.require(:order_item).permit(:name, :price, :quantity, :owner_id, :shop_id, :table_id)
    end
end
