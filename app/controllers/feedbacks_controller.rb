class FeedbacksController < ApplicationController

  def create
    if request.xhr?
      @feedback = Feedback.new(params[:feedback])
      if @feedback.save
        AdminUser.all.each do |user|
          FeedbackMailer.delay.feedback_email(user.email, @feedback)
        end
        render json: {}, status: :ok
      else
        render json: { errors: @feedback.errors.messages }, status: :precondition_failed
      end
    end
  end

end
