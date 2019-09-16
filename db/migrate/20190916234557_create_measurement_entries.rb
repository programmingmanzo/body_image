class CreateMeasurementEntries < ActiveRecord::Migration
  def change
    create_table :measurement_entries do |t|
      t.string :measurements 
      t.integer :user_id 

      t.timestamps null: false #This line will automatically gives you time stamp any time you create or update any model
    end
  end
end
