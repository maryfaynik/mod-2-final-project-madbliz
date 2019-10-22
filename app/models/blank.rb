class Blank < ApplicationRecord
  belongs_to :madlib

  # POS = ["verb", "adverb", "noun", "adjective", "plural noun", "part of the body", 
  # "article of clothing", "verb ending in -ing", "past-tense verb", "type of liquid", "a place",
  # "foreign country", "animal"]

  validates :speech_part, presence: true
end
