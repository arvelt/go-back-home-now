class CreateEndtimes < ActiveRecord::Migration
  def change
    create_table :endtimes do |t|
      t.string :user_id
      t.string :date
      t.time :time

      t.timestamps
    end
	add_index :endtimes , [:user_id,:date], :uniqe => true
  end
end
