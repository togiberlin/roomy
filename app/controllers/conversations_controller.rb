class ConversationsController < ApplicationController
  before_action :authenticate_user!

  def index
    # .all doesn't scale well. In production, use will_paginate gem for that
    @users = User.all
    @conversations = Conversation.involving(current_user)
  end

  def create
    # Check, if conversation between person A and B already exists.
    if Conversation.between(params[:sender_id], params[:recipient_id]).present?
      @conversation = Conversation.between(params[:sender_id], params[:recipient_id]).first
    else
      # Else, just create a new conversation.
      @conversation = Conversation.create(conversation_params)
    end

    redirect_to conversation_messages_path(@conversation)
  end

  private

  def conversation_params
    params.permit(:sender_id, :recipient_id)
  end
end
