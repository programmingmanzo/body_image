class MeasurementEntry < ActiveRecord::Base

    belongs_to :user #Means you would need a foreign key in your user db 
     
end
