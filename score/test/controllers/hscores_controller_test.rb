require 'test_helper'

class HscoresControllerTest < ActionController::TestCase
  setup do
    @hscore = hscores(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:hscores)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create hscore" do
    assert_difference('Hscore.count') do
      post :create, hscore: { game: @hscore.game, score: @hscore.score }
    end

    assert_redirected_to hscore_path(assigns(:hscore))
  end

  test "should show hscore" do
    get :show, id: @hscore
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @hscore
    assert_response :success
  end

  test "should update hscore" do
    patch :update, id: @hscore, hscore: { game: @hscore.game, score: @hscore.score }
    assert_redirected_to hscore_path(assigns(:hscore))
  end

  test "should destroy hscore" do
    assert_difference('Hscore.count', -1) do
      delete :destroy, id: @hscore
    end

    assert_redirected_to hscores_path
  end
end
