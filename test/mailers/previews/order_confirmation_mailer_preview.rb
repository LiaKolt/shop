# Preview all emails at http://localhost:3000/rails/mailers/order_confirmation_mailer
class OrderConfirmationMailerPreview < ActionMailer::Preview
  def order_email_preview
    OrderConfirmationMailer.order_email(Order.first)
  end


end
