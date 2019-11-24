class OrderMailer < ApplicationMailer
  def new_order_email_admin
    @order = params[:order]

    mail(to: ENV["ADMIN_EMAIL"], subject: "NUOVO ORDINE vivaiomillefoglie.it")
  end

  def new_order_email_customer
    @order = params[:order]

    mail(to: @order.email, subject: "Il tuo ordine con Vivaio Millefoglie")
  end
end
