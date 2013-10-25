# encoding: utf-8

class OnlineCourierMailer < ActionMailer::Base
  default from: "noreply@me31.ru"

  def order_of_courier(online_courier)
    @online_courier = online_courier

    mail :to => AdminUser.all.map(&:email),
         :subject => "Вызов курьера"
  end
end