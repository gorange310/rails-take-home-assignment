class CreatePortfolioStocks < ActiveRecord::Migration[6.1]
  def change
    create_table :portfolio_stocks do |t|
      t.integer :portfolio_id, :index => true
      t.integer :stock_id, :index => true
      t.timestamps
    end

    add_index :portfolio_stocks, [:portfolio_id, :stock_id], :unique =>  true
  end
end
