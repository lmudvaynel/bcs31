class WorkersController < ApplicationController
  def index
    @workers = Worker.order("position ASC")
    @page = Page.find_by_slug("about")
  end
end