require 'test_helper'

class TagInstancesControllerTest < ActionController::TestCase
  setup do
    @tag_instance = tag_instances(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tag_instances)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tag_instance" do
    assert_difference('TagInstance.count') do
      post :create, tag_instance: { timestamp: @tag_instance.timestamp }
    end

    assert_redirected_to tag_instance_path(assigns(:tag_instance))
  end

  test "should show tag_instance" do
    get :show, id: @tag_instance
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tag_instance
    assert_response :success
  end

  test "should update tag_instance" do
    patch :update, id: @tag_instance, tag_instance: { timestamp: @tag_instance.timestamp }
    assert_redirected_to tag_instance_path(assigns(:tag_instance))
  end

  test "should destroy tag_instance" do
    assert_difference('TagInstance.count', -1) do
      delete :destroy, id: @tag_instance
    end

    assert_redirected_to tag_instances_path
  end
end
