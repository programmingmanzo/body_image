class User < ActiveRecord::Base
    has_secure_password #allows us to use an activerecord method called authenticate.  

    has_many :measurement_entries
class User < ActiveRecord::Base 

end
