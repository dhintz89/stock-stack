class CreateSecurities < ActiveRecord::Migration[5.2]
  def change
    create_table :securities do |t|
      t.string :symbol
      t.string :companyName
      t.string :primaryExchange
      t.string :calculationPrice
      t.float :open
      t.float :close
      t.float :high
      t.float :low
      t.float :latestPrice
      t.string :latestSource
      t.datetime :latestUpdate
      t.integer :latestVolume
      t.float :previousClose
      t.float :change
      t.float :changePercent
      t.integer :market_cap
      t.integer :peRatio
      t.float :week52High
      t.float :week52Low
      t.float :ytdChange

      t.timestamps
    end
  end
end
