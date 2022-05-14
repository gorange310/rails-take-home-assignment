class CreatePortfolios < ActiveRecord::Migration[6.1]
  def change
    create_table :portfolios do |t|
      t.integer :user_id, :index => true
      t.string :name
      t.integer :position, :index => true
      t.timestamps
    end
  end
end
