class CreateStocks < ActiveRecord::Migration[6.1]
  def change
    create_table :stocks do |t|
      t.string :ticker, :null => false, :unique => true, :index => true
      t.string :name
      t.timestamps
    end
  end
end
