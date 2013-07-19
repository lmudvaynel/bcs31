class ReviewsController < ApplicationController

  def index
    @reviews = Review.moderated
    @review = Review.new
  end

end
