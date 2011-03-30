class CommentsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :prepare
  
  def new    
    @comment = Comment.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @comment }
    end
  end

  def create
    @comment = Comment.new(params[:comment])
    @comment.user = current_user
    @comment.message = @message

    respond_to do |format|
      if @comment.save
        format.html { redirect_to(@message, :notice => 'Message was successfully created.') }
        format.xml  { render :xml => @message, :status => :created, :location => @message }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @comment.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    
    if @comment.destroyable?(current_user)
      flash[:notice] = "Comment deleted"
      @comment.destroy
    else
      flash[:alert] = "Not allowed to delete this comment"
    end

    respond_to do |format|
      format.html { redirect_to(@message) }
      format.xml  { head :ok }
    end
  end

  private
  def prepare
    @message = Message.find(params[:message_id])
  end

end
