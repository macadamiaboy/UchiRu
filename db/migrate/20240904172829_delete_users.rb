class DeleteUsers < ActiveRecord::Migration[7.1]
  def change
    remove_index :users, :email
    
    drop_table :users do |t|
      t.string :email, null: false
      t.timestamps null: false
    end
  end
end
