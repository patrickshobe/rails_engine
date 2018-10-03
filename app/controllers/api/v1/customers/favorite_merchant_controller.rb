class Api::V1::Customers::FavoriteMerchantController < ApplicationController
  def show
    render json: Merchant
                 .joins('join invoices on invoices.merchant_id =
                        merchants.id')
                 .joins('join transactions on transactions.invoice_id =
                        invoices.id')
                 .order('count(transactions.id) desc')
                 .where('invoices.customer_id = ?', params[:customer_id])
                 .group(:id)
                 .limit(1).first
  end
end
