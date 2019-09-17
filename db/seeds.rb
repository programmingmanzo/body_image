#here is where I will create some seed data to work with and test

#create 2 users 

manzo = User.create(name: "Manzo", email: "manzo@manzo.com", password: "password")
maryam = User.create(name: "Maryam", email: "maryam@maryam.com", password: "password")

#Create some measurement entries
MeasurementEntry.create(
    weight: "225",
    waist: "38",
    hips: "34",
    right_arm: "17",
    left_arm: "16.5",
    right_thigh: "23",
    left_thigh: "22.5"
    )   

#Use AR to pre-associate data:

maryam.measurement_entries.create(
    weight: "120",
    waist: "12",
    hips: "11",
    right_arm: "8",
    left_arm: "8",
    right_thigh: "11",
    left_thigh: "12"
    )

#maryam_entry = maryam.measurement_entries.build(waist: "12") #build instatiates a object that is already associated with a foreign key
#maryam_entry.save 