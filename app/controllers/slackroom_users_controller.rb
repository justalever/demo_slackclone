class SlackroomUsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_slackroom

  def create
    # only permits one join table record per user, per chatroom
    # looks up slackroom id + user id & either grabs the first if it exists otherwise it will create a new one
    @slackroom_user = @slackroom.slackroom_users.where(user_id: current_user.id).first_or_create
    redirect_to @slackroom
  end

  def destroy
    # if there happens to be multiple in the slackroom we destroy all of them
    # You could set up unique columns in your table to help with validations and safer data here.
    # You can add/rollback previous migrations to make that switch if you like.
    @slackroom_user = @slackroom.slackroom_users.where(user_id: current_user.id).destroy_all
    redirect_to slackrooms_path
  end

  private

    def set_slackroom
      # grabs the slackroom id from the url
      @slackroom = Slackroom.find(params[:slackroom_id])
    end

end
