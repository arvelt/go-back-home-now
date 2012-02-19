class AddColumnAccounttypeToUser < ActiveRecord::Migration
  def up
    add_column :users , :account_type , :string
  end

  def down
    remove_column :users , :account_type , :string
  end
end
