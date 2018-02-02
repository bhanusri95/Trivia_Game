class Trivium < ApplicationRecord
	
	validates :user_id, presence: true
	validates :question, presence:true
	validates :answer, presence:true
  validates :category, presence:true
	belongs_to :user
	default_scope -> { order('created_at DESC') }

end
