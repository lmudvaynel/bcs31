class ReviewsController < ApplicationController

  def index
    @reviews = Review.moderated
  end

end
