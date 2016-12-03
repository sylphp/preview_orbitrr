require 'test_helper'

class MissionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
	test "Mission attributes must not be empty" do
	  mission = Mission.new
	  assert mission.invalid?
	  assert mission.errors[:title].any?
	  assert mission.errors[:description].any?
	  assert mission.errors[:requirements].any?
	  assert mission.errors[:user_id].any?
	  # assert mission.errors[:budget].any?
	end

	test "Budget must be positive or blank" do
		mission = Mission.new(title: "test mission",
													description: "test description",
													requirements: "test requirements")

		mission.budget = -1
		assert mission.invalid?
		assert_equal ["must be not be negative"],
			mission.errors[:budget]

		mission.budget = 0
		assert mission.invalid?
		assert_equal ["If 0, leave blank"],
			mission.errors[:budget]
		
		mission.budget = 1
		assert mission.valid?
	end

end
