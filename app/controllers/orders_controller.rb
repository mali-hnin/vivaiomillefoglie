class OrdersController < ApplicationController
  def new
      @order = Order.new
    end

    def create
      @order = Order.new(order_params)

      if @order.save
        OrderMailer.with(order: @order).new_order_email.deliver_later

        flash[:success] = "Thank you for your order! We'll get contact you soon!"
        redirect_to root_path
      else
        flash.now[:error] = "Your order form had some errors. Please check the form and resubmit."
        render :new
      end
    end

    private

    def order_params
      params.require(:order).permit(:name, :email, :address, :phone, :message)
    end
end
