class Api::V1::Items::BestDayController < ApplicationController
  def show
    render json: {"best_day": Item.best_day(params[:item_id]) }
  end
end
