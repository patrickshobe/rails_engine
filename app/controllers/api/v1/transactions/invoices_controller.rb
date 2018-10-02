class Api::V1::Transactions::InvoicesController < ApplicationController
  def index
    render json: Transaction.includes(:invoice).find(params[:transaction_id]).invoice
  end
end
