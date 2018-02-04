class Tag < ApplicationRecord
	validates :name, presence:true
	has_many :taggings
    has_many :trivia, through: :taggings
    has_many :scores
    has_many :users, through: :scores
end
