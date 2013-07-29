class OnlineCouriersController < ApplicationController
  #def new
  # @online_courier = OnlineCourier.new
  #end

  def create
    @online_courier = OnlineCourier.new(params[:@online_courier])
    if @online_courier.save
      OnlineCouriertMailer.order_of_courier(@courier).deliver
      redirect_to thanks_path(courier_id: @courier.id)
    #else
     # @page = Page.find_by_slug('order_of_courier')
     # render 'pages/order_of_courier'
    #end
    end
  end

  def thanks_order
    #@order = Order.find(params['order_id'])
  end

end