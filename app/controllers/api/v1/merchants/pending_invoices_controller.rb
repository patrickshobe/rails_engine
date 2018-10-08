class Api::V1::Merchants::PendingInvoicesController < ApplicationController
  def show
    render json: Merchant.pending_invoices(params[:merchant_id])
  end
end
