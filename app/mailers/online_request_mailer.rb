class OnlineCouriertMailer < ActionMailer::Base

  def order_of_courier(courier)
    @first_name = courier.first_name
    @last_name = courier.last_name
    @phone = courier.phone

    mail :to => AdminUser.all.map(&:last_name),
         :subject => "Вызов курьера"
  end
end