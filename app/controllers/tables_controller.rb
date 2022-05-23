class TablesController < ApplicationController
  before_action :set_table, only: %i[ show update destroy ]
  before_action :get_shop

  # GET /tables
  def index
    @tables = @shop.tables
    render :index
  end

  # GET /tables/1
  def show
    @table = Table.find_by(shop_id: @shop.id, id: @table.id)
    if @table && @table.shop_id == @shop.id
      @order_items = @table.order_items
      @requests = @table.requests
      render :show
    else
      render json: "No such table on this shop!", status: 404
    end
  end

  # POST /tables
  def create
    @table = @shop.tables.new(table_params)

    if @table.save
      render json: @table, status: :created, location: @shop
    else
      render json: @table.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tables/1
  def update
    if @table.status != 0
      authorize(@table)
      if @table.update(table_params)
        @table.order_items.delete_all
        @table.requests.delete_all
        @table.update(owner_id: "")
        render :update
      end
    else
      if(@table.update(status: params[:status], owner_id: params[:owner_id]))
        render :update
      else
        render json: @table.errors, status: :unprocessable_entity
      end
    end
  end

  # DELETE /tables/1
  def destroy
    @table.destroy
    render json: "Table deleted."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_table
      @table = Table.find_by(shop_id: params[:shop_id], id: params[:id])
    end

    def get_shop
      @shop = Shop.find(params[:shop_id])
    end

    # Only allow a list of trusted parameters through.
    def table_params
      params.require(:table).permit(:table_no, :status, :owner_id, :id)
    end
end
