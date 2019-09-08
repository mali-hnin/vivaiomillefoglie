module PlantsHelper

  def plant_author(plant)
    user_signed_in? && current_user.id == plant.user_id
  end

end
