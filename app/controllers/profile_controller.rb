class ProfileController < ApplicationController
  def profile
  end

  def change_fullname

  end


  def edit
    @user = User.find(params[:id])
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

