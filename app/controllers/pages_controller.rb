class PagesController < ApplicationController
  def home
    @next_event = next_event
  end

  def flowerslab
    hash = IgService.new
    @ig_photos = hash.get_ig_feed
  end

  def abbonamento
    hash = IgService.new
    @ig_photos = hash.get_ig_feed
  end

end
