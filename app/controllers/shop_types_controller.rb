class ShopTypesController < ApplicationController
  before_action :set_shop_type, only: %i[ show update destroy ]

  # GET /shop_types
  def index
    @shop_types = ShopType.all

    render json: @shop_types
  end

  # GET /shop_types/1
  def show
    render json: @shop_type
  end

  # POST /shop_types
  def create
    @shop_type = ShopType.new(shop_type_params)

    if @shop_type.save
      render json: @shop_type, status: :created, location: @shop_type
    else
      render json: @shop_type.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /shop_types/1
  def update
    if @shop_type.update(shop_type_params)
      render json: @shop_type
    else
      render json: @shop_type.errors, status: :unprocessable_entity
    end
  end

  # DELETE /shop_types/1
  def destroy
    @shop_type.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shop_type
      @shop_type = ShopType.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def shop_type_params
      params.require(:shop_type).permit(:name)
    end
end
