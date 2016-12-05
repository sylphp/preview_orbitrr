require 'test_helper'

class SubmissionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "Submission attributes must not be blank" do
	  submission = Submission.new
	  assert submission.invalid?
	  assert submission.errors[:title].any?
	  assert submission.errors[:story].any?
	  assert submission.errors[:price].any?
	  assert submission.errors[:mission_id].any?
	  assert submission.errors[:user_id].any?
	end

	test "Budget must be positive or blank" do
		submission = Submission.new(title: "test submission",
																story: "test story",
																mission_id: 1,
																user_id: 1)

		submission.price = -1
		assert submission.invalid?
		assert_equal ["must be greater than or equal to 0.01"],
			submission.errors[:price]

		submission.price = 0
		assert submission.invalid?
		assert_equal ["must be greater than or equal to 0.01"],
			submission.errors[:price]

		submission.price = 1
		assert submission.valid?
	end

	
end
