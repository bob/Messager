class UsersController < ApplicationController
  before_filter :authenticate_user! #, :only => [:follow]
  before_filter :prepare, :except => [:show_friends]
  
  def show
   @translators = @user.translators
   if current_user.id == @user.id
      redirect_to profile_path
   end
  end
  
  def follow    
    relation = Relation.new(:user_id => current_user.id, :translator_id => @user.id)
    
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

 def show_friends
    @translators = current_user.translators
 end

  private
  def prepare
    @user = User.find(params[:user_id])        
  end

end
