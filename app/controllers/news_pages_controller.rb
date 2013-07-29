class NewsPagesController < ApplicationController
  def index
    @news_pages = NewsPage.scoped.order('created_at DESC')
  end

  def show
    @news_page = NewsPage.find(params[:id])
  end
end
