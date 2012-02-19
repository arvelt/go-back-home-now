class AddCorumTwitter < ActiveRecord::Migration
  def up
    add_column :users, :twitter_poststart , :boolean,{:default=>false}
    add_column :users, :twitter_postend , :boolean,{:default=>false}
  end

  def down
    add_column :users, :twitter_poststart
    add_column :users, :twitter_postend
  end
end
