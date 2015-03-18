require "test_helper"

class StepsControllerTest < ActionController::TestCase

  def step
    @step ||= steps :one
  end

  def test_index
    get :index
    assert_response :success
    assert_not_nil assigns(:steps)
  end

  def test_new
    get :new
    assert_response :success
  end

  def test_create
    assert_difference('Step.count') do
      post :create, step: { content: step.content, list_id: step.list_id }
    end

    assert_redirected_to step_path(assigns(:step))
  end

  def test_show
    get :show, id: step
    assert_response :success
  end

  def test_edit
    get :edit, id: step
    assert_response :success
  end

  def test_update
    put :update, id: step, step: { content: step.content, list_id: step.list_id }
    assert_redirected_to step_path(assigns(:step))
  end

  def test_destroy
    assert_difference('Step.count', -1) do
      delete :destroy, id: step
    end

    assert_redirected_to steps_path
  end
end
