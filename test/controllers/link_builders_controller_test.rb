require "test_helper"

class LinkBuildersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @link_builder = link_builders(:one)
  end

  test "should get index" do
    get link_builders_url
    assert_response :success
  end

  test "should get new" do
    get new_link_builder_url
    assert_response :success
  end

  test "should create link_builder" do
    assert_difference('LinkBuilder.count') do
      post link_builders_url, params: { link_builder: { commit: @link_builder.commit, file: @link_builder.file } }
    end

    assert_redirected_to link_builder_url(LinkBuilder.last)
  end

  test "should show link_builder" do
    get link_builder_url(@link_builder)
    assert_response :success
  end

  test "should get edit" do
    get edit_link_builder_url(@link_builder)
    assert_response :success
  end

  test "should update link_builder" do
    patch link_builder_url(@link_builder), params: { link_builder: { commit: @link_builder.commit, file: @link_builder.file } }
    assert_redirected_to link_builder_url(@link_builder)
  end

  test "should destroy link_builder" do
    assert_difference('LinkBuilder.count', -1) do
      delete link_builder_url(@link_builder)
    end

    assert_redirected_to link_builders_url
  end
end
