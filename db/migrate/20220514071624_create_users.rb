class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :email, :null => false, :unique =>  true
      t.timestamps
    end
  end
end
