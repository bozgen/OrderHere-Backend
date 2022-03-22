class ShopsController < ApplicationController
  before_action :set_shop, only: %i[ show update destroy ]

  # GET /shops
  def index
    @shops = Shop.all
    render :index
  end

  # GET /shops/1
  def show
    render :show
  end

  # POST /shops
  def create
    @shop = Shop.new(shop_params)

    if @shop.save
      render :create, status: :created, location: @shop
    else
      render json: @shop.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /shops/1
  def update
    if @shop.update(shop_params)
      render :update
    else
      render json: @shop.errors, status: :unprocessable_entity
    end
  end

  # DELETE /shops/1
  def destroy
    @shop.destroy
    render json: "Shop deleted."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shop
      @shop = Shop.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def shop_params
      params.require(:shop).permit(:id, :shop_type_id, :name, :picture_url)
    end
end
