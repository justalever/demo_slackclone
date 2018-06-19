require 'test_helper'

class SlackroomsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @slackroom = slackrooms(:one)
  end

  test "should get index" do
    get slackrooms_url
    assert_response :success
  end

  test "should get new" do
    get new_slackroom_url
    assert_response :success
  end

  test "should create slackroom" do
    assert_difference('Slackroom.count') do
      post slackrooms_url, params: { slackroom: { name: @slackroom.name } }
    end

    assert_redirected_to slackroom_url(Slackroom.last)
  end

  test "should show slackroom" do
    get slackroom_url(@slackroom)
    assert_response :success
  end

  test "should get edit" do
    get edit_slackroom_url(@slackroom)
    assert_response :success
  end

  test "should update slackroom" do
    patch slackroom_url(@slackroom), params: { slackroom: { name: @slackroom.name } }
    assert_redirected_to slackroom_url(@slackroom)
  end

  test "should destroy slackroom" do
    assert_difference('Slackroom.count', -1) do
      delete slackroom_url(@slackroom)
    end

    assert_redirected_to slackrooms_url
  end
end
