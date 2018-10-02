class Api::V1::Customers::FindController < ApplicationController
  def show
    render json: Customer.find_by(customer_params)
  end

  def index
    render json: Customer.where(customer_params)
  end
  private
  def customer_params
    params.permit(:first_name, :last_name, :id, :updated_at, :created_at)
  end
end
