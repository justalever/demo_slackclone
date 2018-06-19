class CreateSlackrooms < ActiveRecord::Migration[5.2]
  def change
    create_table :slackrooms do |t|
      t.string :name

      t.timestamps
    end
  end
end
