class OrderItemsController < ApplicationController
  before_action :set_order_item, only: %i[ show update destroy ]
  before_action :get_table
  before_action :get_shop, only: :create

  # GET /order_items
  def index
    if @table
      @order_items = @table.order_items
      render :index
    end
  end

  # GET /order_items/current
  def current
    if @table
      @order_items = @table.order_items.where(status: false)
      render :index
    end
  end

  # POST /order_items
  def create
    if @table && isTableClaimed 
      p = 0
      @orders = []
      create_order_item_params[:items].each do |item|
        @order_item = @table.order_items.new(item)
        if @order_item.save
          p+=1
          @orders << @order_item
        else
          break
        end
      end
      if @order_item.save && create_order_item_params[:items].length == p
        render :create, status: :created, location: @shop
      else
        render json: @order_item.errors, status: :unprocessable_entity
      end
    else
      render json: "You are not allowed to order for that table right now."
    end
  end

  # PATCH/PUT /order_items/1
  def update
    if @order_item.update(order_item_params)
      render :update
    else
      render json: @order_item.errors, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order_item
      @order_item = OrderItem.find(params[:id])
    end

    def get_table
      @table = Table.find_by(id: params[:table_id], shop_id: params[:shop_id])
    end 

    def get_shop
      @shop = Shop.find(params[:shop_id])
    end

    def isTableClaimed 
      return create_order_item_params[:items][0][:owner_id] === @table.owner_id
    end

    # Only allow a list of trusted parameters through.
    def create_order_item_params
      params.permit(items: [:name, :price, :quantity, :owner_id, :shop_id, :table_id, :status])
    end

    def order_item_params
      params.permit(:name, :price, :quantity, :owner_id, :shop_id, :table_id, :status)
    end
end
