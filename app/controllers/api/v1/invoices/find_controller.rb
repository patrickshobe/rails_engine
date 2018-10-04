class Api::V1::Invoices::FindController < ApplicationController
  def show
    render json: Invoice.find_by(invoice_item_params)
  end

  def index
    render json: Invoice.where(invoice_item_params)

  end
  private
  def invoice_item_params
    params.permit(:id,
                  :customer_id,
                  :merchant_id,
                  :status,
                  :created_at,
                  :updated_at
                  )
  end
end
