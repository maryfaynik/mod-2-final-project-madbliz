class User < ApplicationRecord
    has_many :favorites
    has_many :madlibs, through: :favorites
    has_many :orders
    has_secure_password
    #creates password and password_confirmation

    before_create do 
        puts "hi"
        self.password = Digest::SHA256.new.digest(self.password)
    end
end
