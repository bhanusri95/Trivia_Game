class Trivium < ApplicationRecord
	
	validates :user_id, presence: true
	validates :question, presence:true
	validates :answer, presence:true
  validates :tag_list, presence:true
	belongs_to :user
	has_many :taggings
  has_many :tags, through: :taggings
  has_reputation :votes, source: :user, aggregated_by: :sum
	#default_scope -> { order('votes DESC') }

	def self.tagged_with(name)
      Tag.find_by_name!(name).trivia
    end

    def self.tag_counts
      Tag.select("tags.*, count(taggings.tag_id) as count").
        joins(:taggings).group("taggings.tag_id")
    end
  
    def tag_list
      tags.map(&:name).join(", ")
    end
  
    def tag_list=(names)
      self.tags = names.split(",").map do |n|
        Tag.where(name: n.strip).first_or_create!
      end
    end
end
