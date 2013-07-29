class NewsPagesController < ApplicationController
  def index
    @news_pages = NewsPage.order('created_at DESC').all
  end

  def show
    @news_page = NewsPage.find(params[:id])
  end
end
