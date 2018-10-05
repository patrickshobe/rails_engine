class Api::V1::Invoices::MerchantsController< ApplicationController
  def index
    render json: Invoice
                 .includes(:merchant)
                 .find(params[:invoice_id])
                 .merchant
  end
end
