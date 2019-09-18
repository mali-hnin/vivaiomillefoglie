class CartMailer < ApplicationMailer
  def new_cart_email
      @cart = params[:cart]

      mail(to: <ADMIN_EMAIL>, subject: "You got a new order!")
    end
end
