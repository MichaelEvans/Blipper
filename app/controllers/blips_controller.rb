class BlipsController < ApplicationController

  before_filter :login_required
  
  def create
    blip = current_user.blips.build(params[:blip])
    blip.created_at = Time.now #HACK
    if blip.save
      redirect_to root_path
    else
       
    end
  end
  
  def destroy
    
  end

end
