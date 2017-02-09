class OrderConfirmationMailer < ApplicationMailer
  default from: 'Ira.Schetinina@gmail.com'

  def order_email(order)
    @order = order
    mail(to: @order.email, subject: 'Заказ')
  end
end
