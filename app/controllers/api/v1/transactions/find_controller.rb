class Api::V1::Transactions::FindController < ApplicationController
  def show
    render json: Transaction.find_by(transaction_params)
  end

  def index
    render json: Transaction.where(transaction_params)

  end
  private
  def transaction_params
    params.permit(:credit_card_number,
                  :credit_card_expiration_date,
                  :id,
                  :updated_at,
                  :created_at,
                  :result,
                  :invoice_id)
  end
end
