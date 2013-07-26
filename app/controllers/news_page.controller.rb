class NewsPagesController < ApplicationController
  def index
    @news_page = NewsPage.scoped
  end

  def show
    @news_page = NewsPage.find(params[:id])
  end
end
