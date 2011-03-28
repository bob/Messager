class UsersController < ApplicationController
  before_filter :authenticate_user!, :only => [:follow]
  before_filter :prepare
  
  def show
  end
  
  def follow    
    relation = Relation.new(:user_id => current_user, :translator_id => @user.id)
    
    if relation.save
      flash[:notice] = "You followed user"
    else
      flash[:error] = "Error. You are not followed this user"
    end
    
    redirect_to show_user_path(@user)
    
  end
  
  def unfollow
    relation = current_user.relations.where(:translator_id => @user.id).first
    relation.destroy
    
    flash[:notice] = "You unfollow user"
    
    redirect_to show_user_path(@user)
  end

  private
  def prepare
    @user = User.find(params[:user_id])        
  end

end
