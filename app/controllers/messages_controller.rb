class MessagesController < ApplicationController
  before_action do
    @conversation = Conversation.find(params[:conversation_id])
  end
  def index
    @messages = @conversation.messages.order(:created_at)
    if @messages.length > 10
      @over_ten = true
      @messages = Message.where(id: @messages[-10..-1].pluck(:id))
    end
    if params[:m]
      @over_ten = false
      @messages = @conversation.messages
    end
    @messages = @messages.order(:created_at)
    @message = @conversation.messages.build
  end

  respond_to? :js
  def create
    @message = @conversation.messages.build(message_params)
    flash.now[:notice] = if @message.save
                           'メッセージを送信しました'
                         else
                           '空で送信はできません'
                         end
    @messages = @conversation.messages.order(:created_at)
    if @messages.length > 10
      @over_ten = true
      @messages = Message.where(id: @messages[-10..-1].pluck(:id))
    end
    if params[:m]
      @over_ten = false
      @messages = @conversation.messages
    end
    @messages = @messages.order(:created_at)
    @message = @conversation.messages.build
  end

  private

  def message_params
    params.require(:message).permit(:body, :user_id)
  end
end
