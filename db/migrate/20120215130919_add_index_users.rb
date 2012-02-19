class AddIndexUsers < ActiveRecord::Migration
  def up
	add_index :users , [:user_id], :uniqe => true 
  end

  def down
	remove_index :users , [:user_id]
  end
end
