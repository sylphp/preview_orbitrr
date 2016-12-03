class Mission < ApplicationRecord
	belongs_to :user

	validates :title, :description, :requirements, presence: true
	validates :budget, numericality: {greater_than_or_equal_to: 0.01}, allow_blank: true
end
