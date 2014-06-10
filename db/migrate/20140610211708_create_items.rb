class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.string :description
      t.timestamp :deadline
      t.integer :status_id

      t.timestamps
    end
  end
end
