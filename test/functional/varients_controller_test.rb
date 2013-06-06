require 'test_helper'

class VarientsControllerTest < ActionController::TestCase
  setup do
    @varient = varients(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:varients)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create varient" do
    assert_difference('Varient.count') do
      post :create, varient: { term_a_id: @varient.term_a_id, term_b_id: @varient.term_b_id }
    end

    assert_redirected_to varient_path(assigns(:varient))
  end

  test "should show varient" do
    get :show, id: @varient
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @varient
    assert_response :success
  end

  test "should update varient" do
    put :update, id: @varient, varient: { term_a_id: @varient.term_a_id, term_b_id: @varient.term_b_id }
    assert_redirected_to varient_path(assigns(:varient))
  end

  test "should destroy varient" do
    assert_difference('Varient.count', -1) do
      delete :destroy, id: @varient
    end

    assert_redirected_to varients_path
  end
end
