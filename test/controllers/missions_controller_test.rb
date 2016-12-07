require 'test_helper'

class MissionsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @mission = missions(:one_mission_by_user1)
    @mission2 = missions(:two_mission_by_user2)
    sign_in users(:test_user1)
  end

  test "should get index" do
    get missions_url
    assert_response :success
  end

  test "should get new" do
    get new_mission_url
    assert_response :success
  end

  test "should create mission" do
    assert_difference('Mission.count') do
      post missions_url, params: { mission: { budget: @mission.budget, description: @mission.description, requirements: @mission.requirements, title: @mission.title } }
    end

    assert_redirected_to mission_url(Mission.last)
  end

  test "should show mission" do
    get mission_url(@mission)
    assert_response :success
  end

  test "should get edit" do
    get edit_mission_url(@mission)
    assert_response :success
  end

  test "should update mission" do
    patch mission_url(@mission), params: { mission: { budget: @mission.budget, description: @mission.description, requirements: @mission.requirements, title: @mission.title } }
    assert_redirected_to mission_url(@mission)
  end

  test "should destroy mission" do
    assert_difference('Mission.count', -1) do
      delete mission_url(@mission)
    end

    assert_redirected_to missions_url
  end


  # AUTHORIZATION TESTS

  test "should get edit but redirected because not owner" do
    get edit_mission_url(@mission2)
    assert_response :redirect
  end

  test "should update mission but redirected because not owner" do
    patch mission_url(@mission2), params: { mission: { budget: @mission2.budget, description: @mission2.description, requirements: @mission2.requirements, title: @mission2.title } }
    # assert_redirected_to mission_url(@mission)
    assert_response :redirect
  end

  test "should destroy mission but redirected because not owner" do
    assert_no_difference('Mission.count', -1) do
      delete mission_url(@mission2)
    end

    # assert_redirected_to missions_url
    assert_response :redirect
  end

end
