class User < ActiveRecord::Base

    attr_accessible :email, :password, :username

    def self.login( username,  password )
        find_by_username_and_password( username, password )
    end
end
