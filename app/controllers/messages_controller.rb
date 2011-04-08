class MessagesController < ApplicationController

before_filter :authenticate 
before_filter :load_user


def index
  @messages=Message.where('receiver_id IS null')
  
  @message=Message.new
end 

def userMessage
  @messages=Message.all
  @message=Message.new
end

def privateMessages
 @private_messages=Message.where('receiver_id= :rec', :rec=>current_user.id)
end

 def create
      @message=Message.new(params[:message])
      @message.save
 if session['saved_location']=="Messages" then
     redirect_to '/messages'
    else 
      redirect_to '/userMessage/'+session['userMessageParam']
    end


end
 

 private 
  def load_user
   if params[:user_id]!=nil then
    @user= User.find(params[:user_id])
   end
  end


end
