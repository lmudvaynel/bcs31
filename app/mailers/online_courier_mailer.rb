# encoding: utf-8

class OnlineCourierMailer < ActionMailer::Base

  def order_of_courier(online_courier)
    @address = online_courier.address
    @city = online_courier.city

    mail :to => AdminUser.all.map(&:email),
         :subject => "Вызов курьера"
  end
end