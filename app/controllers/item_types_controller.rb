class ItemTypesController < ApplicationController
  before_action :set_item_type, only: %i[ show update destroy ]

  # GET /item_types
  def index
    @item_types = ItemType.all

    render json: @item_types
  end

  # GET /item_types/1
  def show
    render json: @item_type
  end

  # POST /item_types
  def create
    @item_type = ItemType.new(item_type_params)

    if @item_type.save
      render json: @item_type, status: :created, location: @item_type
    else
      render json: @item_type.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /item_types/1
  def update
    if @item_type.update(item_type_params)
      render json: @item_type
    else
      render json: @item_type.errors, status: :unprocessable_entity
    end
  end

  # DELETE /item_types/1
  def destroy
    @item_type.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item_type
      @item_type = ItemType.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def item_type_params
      params.require(:item_type).permit(:name)
    end
end
