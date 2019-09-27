class CreateMeasurementEntries < ActiveRecord::Migration
  def change
    create_table :measurement_entries do |t|
      t.string :weight
      t.string :waist 
      t.string :hips
      t.string :right_arm
      t.string :left_arm
      t.string :right_thigh
      t.string :left_thigh   
      t.integer :user_id 

      t.timestamps null: false
    end
  end
end
