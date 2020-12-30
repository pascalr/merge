require 'test_helper'

class PartialsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @partial = partials(:one)
  end

  test "should get index" do
    get partials_url
    assert_response :success
  end

  test "should get new" do
    get new_partial_url
    assert_response :success
  end

  test "should create partial" do
    assert_difference('Partial.count') do
      post partials_url, params: { partial: { content: @partial.content, name: @partial.name } }
    end

    assert_redirected_to partial_url(Partial.last)
  end

  test "should show partial" do
    get partial_url(@partial)
    assert_response :success
  end

  test "should get edit" do
    get edit_partial_url(@partial)
    assert_response :success
  end

  test "should update partial" do
    patch partial_url(@partial), params: { partial: { content: @partial.content, name: @partial.name } }
    assert_redirected_to partial_url(@partial)
  end

  test "should destroy partial" do
    assert_difference('Partial.count', -1) do
      delete partial_url(@partial)
    end

    assert_redirected_to partials_url
  end
end
