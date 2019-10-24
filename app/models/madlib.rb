class Madlib < ApplicationRecord
    has_many :blanks
    has_many :favorites
    has_many :sentences
    has_many :users, through: :favorites

    # def sentences=(sent)
    #     @sentences = sent
    # end

    # def sentences
    #     @sentences
    # end

    def self.all_categories 
        ["Animals", "Sports", "Action", "Adventure", "Business", "Biography", "Comedy",
    "Technology", "Crime", "Food", "Mystery", "Holiday", "Romance"]
    end


end
