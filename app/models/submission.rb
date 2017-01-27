class Submission < ApplicationRecord
	belongs_to :user
	belongs_to :mission

	validates :title, :story, :price, :user_id, :mission_id, presence: true
	validates :price, numericality: {greater_than_or_equal_to: 0.01}

	has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, 	default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

end
