class HomeController < ApplicationController
  before_filter :login_required
  
  def index
    @blips = current_user.all_blips
  end
  
  def show
    @user = User.find_by_username(params[:username])
    @blips = @user.all_blips
  end
  
end
