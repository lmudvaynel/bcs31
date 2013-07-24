class OnlineCouriersController < ApplicationController
  def new
    @online_courier = OnlineCourier.new
  end

  def create
    @online_courier = OnlineCourier.new(params[:@online_courier])
    if @online_courier.save
      render json: {}, status: :ok
    else
      render json: { errors: @online_courier.errors.messages },
             status: :unprocessable_entity
    end
  end
end
