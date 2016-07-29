#encoding: utf-8
class PagesController < ApplicationController
  layout :layout

  def index
    @news_pages = NewsPage.order('created_at DESC').first(4)
    @page = Page.find_by_slug("index")
    @indexframe=Iframe.find_by_name("index")
  end

  def price_of_delivery
    @cities=City.order('name ASC').where('name  NOT IN (?)', ['МОСКВА','САНКТ-ПЕТЕРБУРГ'] )
    @msk=City.first(2)
    @msk += @cities
    @page = Page.find_by_slug(:price_of_delivery)
    delivery = params[:delivery]
    result = if delivery
      city_from = City.find(delivery[:city_from_id])
      city_to = City.find(delivery[:city_to_id])
      weight = delivery[:weight].gsub(',','.').to_f
      pay_in_affiliate = delivery[:pay_in_affiliate]
      price_cents = city_from.delivery_price_to(city_to, weight, pay_in_affiliate)
      { delivery_price: price_cents.to_f / 100 }
    else
      {}
    end

    respond_to do |format|
      format.html
      format.json do
        render json: result
      end
    end
  end
  
  def show
    @page = Page.find_by_slug(params[:slug]) || Page.find(params[:slug])
    @parent = @page.parent
    if @parent
      while @parent.parent do
        @parent = @parent.parent
      end
    end
    render params[:slug] if controller_view_exists?(params[:slug])
  end

  def robots
    respond_to :text
    expires_in 6.hours, public: true
  end

  private

  def view_exists?(view)
    File.exists? Rails.root.join("app", "views", view)
  end

  def controller_view_exists?(name)
    view_exists?("#{params[:controller]}/#{name}.html.erb")
  end

  def layout_exists?(name)
    view_exists?("layouts/#{name}.html.erb")
  end

  def layout
    main_layout = 'application'
    if @page && @page.layout != main_layout && layout_exists?(@page.layout)
      @page.layout
    else
      main_layout
    end
  end

end
