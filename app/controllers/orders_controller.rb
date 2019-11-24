class OrdersController < ApplicationController
  include CurrentCart
  before_action :set_cart

  def new
    @order = Order.new
    @cart = Cart.find(params[:cart_id])
  end

  def create
    @order = Order.new(order_params)
    @order.cart = Cart.find(params[:cart_id])

    if @order.save
      OrderMailer.with(order: @order).new_order_email_admin.deliver_later
      OrderMailer.with(order: @order).new_order_email_customer.deliver_later
      redirect_to root_path

      flash[:info] = "Ordine inviato con successo! Ti abbiamo inviato una mail di conferma"
    else
      flash.now[:error] = "Il tuo ordine conteneva degli errori. Per favore ricontrolla i campi."
      render :new
    end
  end

    private
    def set_order
      @order = Order.find(params[:id])
    end

    def order_params
      params.require(:order).permit(:name, :email, :address, :phone, :message)
    end
end
