require 'test_helper'

class SubmissionsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @mission = missions(:two)
    @submission = submissions(:two)
    sign_in users(:test_user)
  end

  test "should get index" do
    get submissions_url
    assert_response :success
  end

  # should get new if owner is not the same
  test "should get new" do
    get new_submission_url, params: {mission_id: @mission.id}
    assert_response :success
  end

  test "should create submission" do
    assert_difference('Submission.count') do
      # added mission_id in submission url for passing params
      post submissions_url(mission_id: 2), params: { submission: { price: @submission.price,
                                                    story: @submission.story,
                                                    title: @submission.title,
                                                    mission_id: @submission.mission_id }
                                                  }
    end

    assert_redirected_to submission_url(Submission.last)
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
