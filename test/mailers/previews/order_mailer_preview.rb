# Preview all emails at http://localhost:3000/rails/mailers/order_mailer
class OrderMailerPreview < ActionMailer::Preview
  def new_order_email_admin
    # Set up a temporary order for the preview
    order = Order.find(5)

    OrderMailer.with(order: order).new_order_email_admin
  end

  def new_order_email_customer
    # Set up a temporary order for the preview
    order = Order.find(5)

    OrderMailer.with(order: order).new_order_email_customer
  end
end
