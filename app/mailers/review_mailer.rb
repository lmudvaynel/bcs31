class ReviewMailer < ActionMailer::Base
  default from: "from@example.com"

  def review_email(recepient, review)
    mail(to: recepient, subject: 'You have new review', from: "from@example.com") do |format|
      format.html { render text: review.content }
    end
  end
end
