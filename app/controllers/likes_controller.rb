class LikesController < ApplicationController
    def create 
    cook = Cook.find(params[:cook_id])
    unless cook.liked?(current_user)
      cook.like(current_user)
    end
    redirect_to cooks_path
    end

  def destroy
    cook = Cook.find(params[:id])
    if cook.liked?(current_user)
      cook.unlike(current_user)
    end
    redirect_to cooks_path
  end
end
