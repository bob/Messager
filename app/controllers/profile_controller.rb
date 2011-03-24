class ProfileController < ApplicationController
  before_filter :authenticate_user!
  
  def profile
    
  end

  def change_fullname

  end

  def change_password
    @user = current_user
  end
  
  def update_password
    @user = current_user
    if @user.update_with_password(params[:user])
      flash[:notice] = "Password changed"
      redirect_to profile_path
    else
      render :change_password
    end
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def avatar
    
  end
  
  def update_avatar
    @user = current_user
    if @user.update_attributes(params[:user])
      flash[:notice] = "Avatar changed"
      redirect_to profile_path
    else
      render :avatar
    end
  end


  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @edit.update_attributes(params[:user])
        format.html { redirect_to(@user, :notice => 'User fullname was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

end

