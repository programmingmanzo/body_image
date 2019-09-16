class User < ActiveRecord::Base
    has_secure_password #allows us to use an activerecord method called authenticate.  

end
