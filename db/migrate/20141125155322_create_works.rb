class CreateWorks < ActiveRecord::Migration
  def change
    create_table :works do |t|
      t.datetime :checkin
      t.datetime :checkout
      t.string :job

      t.timestamps
    end
  end
end
