class UsersController < ApplicationController
  before_filter :authenticate_user! #, :only => [:follow]
  before_filter :prepare, :except => [:show_friends]

  def show
   if current_user.id == @user.id
      redirect_to profile_path
   else
      @translators = @user.translators
      @subscribers = @user.subscribers
      @comments = Comment.paginate(:page => params[:page], :conditions => {:commentable_id => @user.id, :commentable_type => 'User' })
   end
  end

  def follow
    relation = Relation.new(:user_id => current_user.id, :translator_id => @user.id)

    if relation.save
      Notifier.following(relation).deliver
      flash[:notice] = "You followed user"
    else
      flash[:error] = "Error. You are not followed this user"
    end

    redirect_to show_user_path(@user)

  end

  def unfollow
    relation = current_user.relations.where(:translator_id => @user.id).first
    Notifier.unfollowing(relation).deliver
    relation.destroy

    flash[:notice] = "You unfollow user"

    redirect_to show_user_path(@user)
  end

 def show_friends
    @translators = current_user.translators

    # @messages = []
    # @translators.each do |translator|
    #   @messages << translator.messages
    # end
    # @messages.flatten!
    # @messages.sort! {|a,b| b.created_at <=> a.created_at}

    @messages = Message.paginate(:page => params[:page], :conditions => ["user_id IN (#{@translators.map(&:id).join(",")})"], :order => "created_at DESC")
 end

  private
  def prepare
    @user = User.find(params[:user_id])
  end

end

