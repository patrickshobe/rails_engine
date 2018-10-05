class Api::V1::Invoices::CustomersController< ApplicationController
  def index
    render json: Invoice
                 .includes(:customer)
                 .find(params[:invoice_id])
                 .customer
  end
end
