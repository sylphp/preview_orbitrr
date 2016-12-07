require 'test_helper'

class SubmissionsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @mission = missions(:one_mission_by_user1)
    @mission2 = missions(:two_mission_by_user2)
    @submission = submissions(:one_submission_by_user1_mission1)
    sign_in users(:test_user1)
  end

  test "should get index" do
    get submissions_url
    assert_response :success
  end

  test "should get new" do
    get new_submission_url, params: {mission_id: @mission2.id}
    assert_response :success
  end

  # should get new if owner is not the same
  test "should get new but redirected because same owner" do
    get new_submission_url, params: {mission_id: @mission.id}
    # redirect because same user of the mission
    assert_response :redirect
  end

  test "should create submission" do
    assert_difference('Submission.count') do
      # added mission_id in submission url for passing params
      post submissions_url(mission_id: @mission2.id), params: { submission: { price: @submission.price,
                                                    story: @submission.story,
                                                    title: @submission.title,
                                                    mission_id: @submission.mission_id }
                                                  }
    end

    assert_redirected_to submission_url(Submission.last)
  end

  test "should create submission but redirected because same owner" do
    assert_no_difference('Submission.count') do
      # added mission_id in submission url for passing params
      post submissions_url(mission_id: @mission.id), params: { submission: { price: @submission.price,
                                                    story: @submission.story,
                                                    title: @submission.title,
                                                    mission_id: @submission.mission_id }
                                                  }
    end

    assert_redirected_to missions_url
  end

  test "should show submission" do
    get submission_url(@submission)
    assert_response :success
  end

  test "should get edit" do
    get edit_submission_url(@submission)
    assert_response :success
  end

  test "should update submission" do
    patch submission_url(@submission), params: { submission: {price: @submission.price,
                                                              story: @submission.story,
                                                              title: @submission.title,
                                                              mission_id: @submission.mission_id }
                                                              }
    assert_redirected_to submission_url(@submission)
  end

  test "should destroy submission" do
    assert_difference('Submission.count', -1) do
      delete submission_url(@submission)
    end

    assert_redirected_to submissions_url
  end

end
