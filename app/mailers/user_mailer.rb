class UserMailer < ApplicationMailer
  def order_receipt (order)
    @url  = 'http://jungle.com/login'

    mail(to: order.email, subject: 'Your Order' + order.id.to_s)
  end
end
