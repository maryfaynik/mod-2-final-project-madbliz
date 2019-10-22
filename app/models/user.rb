class User < ApplicationRecord
    has_many :favorites
    has_many :madlibs, through: :favorites
    has_many :orders
    has_secure_password
    #creates password and password_confirmation
    validates :user_name, uniqueness: true

    def to_name
        first_name + ' ' + last_name
    end
end

