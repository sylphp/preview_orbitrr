class Mission < ApplicationRecord
	belongs_to :user
	has_many :submissions

	validates :title, :description, :requirements, :user_id, presence: true
	validates :budget, numericality: {greater_than_or_equal_to: 0.01}, allow_blank: true
end
