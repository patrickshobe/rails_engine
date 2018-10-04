class Api::V1::Invoices::TransactionsController < ApplicationController
  def index
    render json: Invoice
                 .includes(:transactions)
                 .find(params[:invoice_id])
                 .transactions
  end
end
