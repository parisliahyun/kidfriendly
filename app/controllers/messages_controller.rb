class MessagesController < ApplicationController
 before_filter :set_user
 # :authenticate_user!
 
def new
  @message = Message.new
    if params[:reply_to]
      @reply_to = User.find_by_user_id(params[:reply_to])
    unless @reply_to.nil?
      @message.recipient_id = @reply_to.user_id
    end
  end
end
 
def create
  @message = Message.new(message_params)
  @message.sender_id = current_user.id
  @reply_to = current_user.id
  if @message.save
    flash[:notice] = "Message has been sent"
    redirect_to user_messages_path(current_user, :mailbox=>:inbox)
  else
    render :action => :new
  end
end

def sent
  @messages = Message.where(recipient_id: [current_user.id.to_s]) 
  render :sent
end

def index
  # if params[:mailbox] == "sent"
    # @messages = Message.where(sender_id: [current_user.id.to_s]) 
    # render :sent
    # elsif params[:mailbox] == "inbox"
    @messages = Message.where(recipient_id: [current_user.id.to_s]) 
  # elsif params[:mailbox] == "archived"
    # @messages = @user.archived_messages
  # end
  render :index
end
 
  def show
    @message = Message.find_by(id: params[:id])
    render :show
  end
 
 private

   def message_params
      params.require(:message).permit(:recipient_id, :subject, :body)
   end

   def set_user
    @user = current_user
   end
end
