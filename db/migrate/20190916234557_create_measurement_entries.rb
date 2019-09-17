class CreateMeasurementEntries < ActiveRecord::Migration
  def change
    create_table :measurement_entries do |t|
      t.string :weight
      t.string :hips
      t.string :right_arm
      t.string :left_arm
      t.string :right_thigh
      t.string :left_thigh   
      t.integer :user_id #Having this line should tell you to add associations between models 

      t.timestamps null: false #This line will automatically gives you time stamp any time you create or update any model
    end
  end
end
