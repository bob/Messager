class MessagesController < ApplicationController
  before_filter :authenticate_user!

  # GET /messages
  # GET /messages.xml
  def index
    @messages = current_user.messages

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @messages }
    end
  end

  # GET /messages/1
  # GET /messages/1.xml
  def show
    @message = Message.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @message }
    end
  end

  def current
    @message = current_user.messages.order(:created_at).last
    #redirect_to message_path(@message)
    render :show
  end

  # GET /messages/new
  # GET /messages/new.xml
  def new
    @message = Message.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @message }
    end
  end

  # GET /messages/1/edit
  def edit
    @message = Message.find(params[:id])

  end

  # POST /messages
  # POST /messages.xml
  def create
    @message = Message.new(params[:message])
    @message.user = current_user

    respond_to do |format|
      if @message.save
        format.html { redirect_to(@message, :notice => 'Message was successfully created.') }
        format.xml  { render :xml => @message, :status => :created, :location => @message }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @message.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /messages/1
  # PUT /messages/1.xml
  def update
    @message = Message.find(params[:id])
  
    if @message.modificapable?(current_user)
      flash[:notice] = "Message updated"
      @message.update_attributes(params[:message])
    else
      flash[:alert] = "Not allowed to update this message"
    end

    redirect_to(@message)
  end

  # DELETE /messages/1
  # DELETE /messages/1.xml
  def destroy
    @message = Message.find(params[:id])
    if @message.modificapable?(current_user)
      flash[:notice] = "Message deleted"
      @message.destroy 
    else
      flash[:alert] = "Not allowed to delete this message"
    end

    respond_to do |format|
      format.html { redirect_to(messages_url) }
      format.xml  { head :ok }
    end
  end
end
