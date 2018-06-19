class CreateSlackroomUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :slackroom_users do |t|
      t.references :slackroom, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
