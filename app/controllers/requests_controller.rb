class RequestsController < ApplicationController
  before_action :set_request, only: %i[ show update destroy ]
  before_action :get_table

  # GET /requests
  def index
    @requests = @table.requests
    render :index
  end

  # POST /requests
  def create
    @request = @table.requests.new(request_params)

    if @request.save
      render :create, status: :created, location: @shop
    else
      render json: @request.errors, status: :unprocessable_entity
    end
  end

  # DELETE /requests/1
  def destroy
    @request.destroy
    render json: "Request deleted."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_request
      @request = Request.find(params[:id])
    end

    def get_table
      @table = Table.find(params[:table_id])
    end

    def get_shop
      @shop = Shop.find(params[:shop_id])
    end

    # Only allow a list of trusted parameters through.
    def request_params
      params.require(:request).permit(:purpose, :shop_id, :table_id, :owner_id)
    end
end
