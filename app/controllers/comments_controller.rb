class CommentsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :prepare, :except => [:destroy]

  def new    # create object @comment
    @comment = Comment.new

    respond_to do |format|
      format.html {

      }# new.html.erb
      format.xml  { render :xml => @comment }
    end
  end

  def create    # save comment to DB
    @comment = Comment.new(params[:comment])
    @comment.user = current_user
    @comment.commentable = @commentable

    respond_to do |format|
      if @comment.save
        # Notifier.new_comment(@comment).deliver
        format.html {
          redirect_to(@commentable, :notice => 'Comment was successfully created.')
        }
        format.xml  { render :xml => @commentable, :status => :created, :location => @commentable }
        format.js {

        }
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
      format.html { redirect_to(@comment.commentable) }
      format.xml  { head :ok }
      format.js
    end
  end

  private
  def prepare
    @klass = params[:commentable_type].capitalize.constantize
    @commentable = @klass.find(params[:commentable_id])
  end

end

