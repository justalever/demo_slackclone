class Slackroom < ApplicationRecord
  has_many :slackroom_users, dependent: :destroy
  has_many :users, through: :slackroom_users
  has_many :messages, dependent: :destroy
end
