class SlackroomUser < ApplicationRecord
  belongs_to :slackroom
  belongs_to :user
end
