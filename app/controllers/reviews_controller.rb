# encoding: utf-8
class ReviewsController < ApplicationController

  def index
    @reviews = Review.moderated.order("created_at DESC")
    @review = Review.new
    @page = Page.find_by_slug("reviews")
  end

  def create
    @review = Review.new(params[:review])
     @review.valid?
     if verify_recaptcha(:model => @review, :message => "Неверно введен код.") && @review.save
      AdminUser.all.each do |user|
        ReviewMailer.delay.review_email(user.email, @review)
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
