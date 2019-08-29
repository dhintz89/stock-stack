class CreateSecurities < ActiveRecord::Migration[5.2]
  def change
    create_table :securities do |t|
      t.string :symbol
      t.string :company_name
      t.string :primary_exchange
      t.string :calculation_price
      t.integer :open
      t.integer :close
      t.integer :high
      t.integer :low
      t.integer :latest_price
      t.string :latest_source
      t.datetime :latest_update
      t.integer :latest_volume
      t.integer :iex_realtime_price
      t.integer :iex_realtime_size
      t.datetime :iex_last_updated
      t.integer :delayed_price
      t.datetime :delayed_price_time
      t.integer :previous_close
      t.integer :change
      t.integer :change_percent
      t.integer :iex_market_percent
      t.integer :iex_volume
      t.integer :avg_total_volume
      t.integer :iex_bid_price
      t.integer :iex_bid_size
      t.integer :iex_ask_price
      t.integer :iex_ask_size
      t.integer :market_cap
      t.integer :pe_ratio
      t.integer :week52_high
      t.integer :week52_low
      t.integer :ytd_change

      t.timestamps
    end
  end
end
