class CreateStarttimes < ActiveRecord::Migration
  def change
    create_table :starttimes do |t|
      t.string :user_id
      t.string :date
      t.time :time

      t.timestamps
    end
	add_index :starttimes , [:user_id , :date] , :uniqe => true
  end
end
