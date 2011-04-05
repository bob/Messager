class ProfileController < ApplicationController
  before_filter :authenticate_user!

  def profile
	  @user = current_user
	  @translators = current_user.translators
    @subscribers = current_user.subscribers
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
    @user = current_user
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
    @user = current_user

    if @user.update_attributes(params[:user])
      flash[:notice] = "Profile changed"
      redirect_to profile_path
    else
      render :profile_edit
    end
  end

end

