class User < ActiveRecord::Base
    has_secure_password # we have access to this through bcrypt. Allows us to use an activerecord method called authenticate. Takes a PW as a plain string and checks it agains bcrypt hashing algorithm.    

    has_many :measurement_entries

end
