class CreateSecurities < ActiveRecord::Migration[5.2]
  def change
    create_table :securities do |t|
      t.string :symbol
      t.string :company_name
      t.string :primary_exchange
      t.string :calculation_price
      t.real :open
      t.real :close
      t.real :high
      t.real :low
      t.real :latest_price
      t.string :latest_source
      t.datetime :latest_update
      t.integer :latest_volume
      t.real :previous_close
      t.real :change
      t.real :change_percent
      t.integer :market_cap
      t.integer :pe_ratio
      t.real :week52_high
      t.real :week52_low
      t.real :ytd_change

      t.timestamps
    end
  end
end
