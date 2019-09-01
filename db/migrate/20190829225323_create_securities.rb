class CreateSecurities < ActiveRecord::Migration[5.2]
  def change
    create_table :securities do |t|
      t.string :symbol
      t.string :company_name
      t.string :primary_exchange
      t.string :calculation_price
      t.float :open
      t.float :close
      t.float :high
      t.float :low
      t.float :latest_price
      t.string :latest_source
      t.datetime :latest_update
      t.integer :latest_volume
      t.float :previous_close
      t.float :change
      t.float :change_percent
      t.integer :market_cap
      t.integer :pe_ratio
      t.float :week52_high
      t.float :week52_low
      t.float :ytd_change

      t.timestamps
    end
  end
end
