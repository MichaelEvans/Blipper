class CreateBlips < ActiveRecord::Migration
  def change
    create_table :blips do |t|
      t.integer :user_id
      t.string :message
      t.datetime :created_at

      t.timestamps
    end
  end
end
