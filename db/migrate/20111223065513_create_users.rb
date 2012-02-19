class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :user_id
      t.string :oauth_key
      t.string :oauth_seacretkey

      t.timestamps
    end
  end
end
