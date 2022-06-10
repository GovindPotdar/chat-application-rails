class CreateRooms < ActiveRecord::Migration[7.0]
  def change
    create_table :rooms do |t|
      t.string :room_number
      t.integer :room_type, null:true

      t.timestamps
    end
  end
end
