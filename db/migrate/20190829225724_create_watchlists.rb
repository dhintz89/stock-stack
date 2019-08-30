class CreateWatchlists < ActiveRecord::Migration[5.2]
  def change
    create_table :watchlists do |t|
      t.string :name
      t.string :description
      t.integer :total_value
      t.integer :total_change
      t.integer :last_updated
      t.integer :user_id
      t.integer :security_id

      t.timestamps
    end
  end
end
