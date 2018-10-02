class Api::V1::Transactions::FindController < ApplicationController
  def show
    render json: Transaction.find_by(transaction_params)
  end

  def index
    render json: Transaction.where(transaction_params)
  end
  private
  def transaction_params
    params.permit(:first_name, :last_name, :id, :updated_at, :created_at)
  end
end
