class Api::V1::Items::MerchantsController< ApplicationController
  def index
    render json: Item
                 .includes(:merchant)
                 .find(params[:item_id])
                 .merchant
  end
end
