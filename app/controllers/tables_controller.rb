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
    if @table
      render :show
    else
      render json: "No such table on this shop!"
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
    if @table.update(table_params)
      render :update
      if @table.status == 0
        @table.order_items.delete_all
        @table.requests.delete_all
      end
    else
      render json: @table.errors, status: :unprocessable_entity
    end
  end
  
  # claim
  def claim
    table = Table.where(:table_no => params[:table_no] && :shop_id => Shop.where(:name => params[:shop]))
    if table.status == 0
      if table.update
        render :update
      else
        render json: table.errors, status: :unprocessable_entity
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
      @table = Table.find(params[:id])
    end

    def get_shop
      @shop = Shop.find(params[:shop_id])
    end

    # Only allow a list of trusted parameters through.
    def table_params
      params.require(:table).permit(:table_no, :status, :owner_id)
    end
end
