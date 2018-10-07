class Api::V1::Merchants::TotalRevenueController < ApplicationController
  def show
    revenue_data = Merchant.total_revenue(params[:date])
    render json: {  "total_revenue": revenue_data }
  end
end
