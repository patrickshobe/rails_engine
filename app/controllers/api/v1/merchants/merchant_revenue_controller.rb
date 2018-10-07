class Api::V1::Merchants::MerchantRevenueController < ApplicationController
  def show
    if params[:date]
      revenue_data = Merchant.merchant_revenue_date(params)
    else
      revenue_data = Merchant.merchant_revenue(params[:merchant_id])
    end

    render json: {  "revenue": revenue_data.sum }
  end
end
