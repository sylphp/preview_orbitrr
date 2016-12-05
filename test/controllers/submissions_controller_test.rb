require 'test_helper'

class SubmissionsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @mission = missions(:one)
    @submission = submissions(:one)
    sign_in users(:test_user)
  end

  test "should get index" do
    get submissions_url
    assert_response :success
  end

  test "should get new" do
    get new_submission_url, params: {mission_id: @mission.id}
    assert_response :success
  end

  test "should create submission" do
    assert_difference('Submission.count') do
      post submissions_url, params: { submission: { price: @submission.price,
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
