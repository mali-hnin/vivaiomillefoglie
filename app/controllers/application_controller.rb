class ApplicationController < ActionController::Base
  include Pagy::Backend
  protect_from_forgery with: :exception
  include CurrentCart
  before_action :set_cart

  helper_method :current_cart


  def current_cart
    if session[:cart_id]
      Cart.find(session[:cart_id])
    else
      Cart.new
    end
  end

  def next_event
    @next_event = VivaioEvent.by_event_date.future.first
  end

end
