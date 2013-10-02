class WorkersController < ApplicationController
  def index
    @workers = Worker.all
    @page = Page.find_by_slug("about")
  end
end