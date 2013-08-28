# encoding: utf-8
class ReviewsController < ApplicationController

  def index
    @reviews = Review.moderated
    @review = Review.new
    @page = Page.find_by_slug("reviews")
  end

  def create
    @review = Review.new(params[:review])
    if @review.save
      AdminUser.all.each do |user|
        ReviewMailer.review_email(user.email, @review).deliver
      end
      flash[:notice] = 'Ваш отзыв отправлен на модерацию'
      redirect_to reviews_path
    else
      @reviews = Review.moderated
      @page = Page.find_by_slug("reviews")
      render :index
    end
  end

end
