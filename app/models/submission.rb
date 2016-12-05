class Submission < ApplicationRecord
	belongs_to :user
	belongs_to :mission

	validates :title, :story, :price, :user_id, :mission_id, presence: true
	validates :price, numericality: {greater_than_or_equal_to: 0.01}

end
