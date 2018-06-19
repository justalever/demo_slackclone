class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_slackroom
  skip_before_action :verify_authenticity_token


  def create
    message = @slackroom.messages.new(message_params)
    message.user = current_user
    message.save
    redirect_to @slackroom
    # MessageRelayJob.perform_later(message)
    #  respond_to do |format|
    #    format.js
    # end
  end

  private

    def set_slackroom
      @slackroom = Slackroom.find(params[:slackroom_id])
    end

    def message_params
      params.require(:message).permit(:content)
    end
end
