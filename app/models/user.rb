class User < ApplicationRecord
    has_many :favorites
    has_many :madlibs, through: :favorites
    has_many :orders
    has_secure_password
    #creates password and password_confirmation
    validate :uniqueness_of_un


    def to_name
        first_name + ' ' + last_name
    end

    private

    def uniqueness_of_un
        unless user_name.present?
            errors.add(:user_name, "Please enter a username")
        else
            unless User.all.find_by(user_name: user_name).nil?
                errors.add(:user_name, "Username is not unique")
            end
        end
    end
end

