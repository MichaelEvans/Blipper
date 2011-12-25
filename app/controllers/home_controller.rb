class HomeController < ApplicationController
  before_filter :login_required
  
  def index
    @blips = current_user.all_blips
  end
  
  def show
    @user = User.find_by_username(params[:username])
    @blips = @user.all_blips
  end
  
  def toggle_follow
    @user = User.find_by_username(params[:username])
    if current_user.is_friend? @user
      flash[:notice] = "You are no longer following @#{@user.username}"
      current_user.remove_friend(@user)
    else
      flash[:notice] = "You are now following @#{@user.username}"
      current_user.add_friend(@user)
    end
    redirect_to user_blips_path(@user.username)
  end
  
end
