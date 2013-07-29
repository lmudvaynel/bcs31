class OnlineCouriersController < ApplicationController

  def new
   @online_courier = OnlineCourier.new
  end

  def create
    @online_courier = OnlineCourier.new(params[:online_courier])
    if @online_courier.save
      OnlineCourierMailer.order_of_courier(@online_courier).deliver
      redirect_to thanks_path(courier_id: @online_courier.id)
    else
      @page = Page.find_by_slug('online_couriers')
      render 'online_couriers/new'
    end
  end

  def thanks_order
    @order = Order.find(params['order_id'])
  end

end