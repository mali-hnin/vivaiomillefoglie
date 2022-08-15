class GardensController < ApplicationController

  private
  def garden_params
    params.require(:garden).permit(:title, :description, :photo)
  end
end
