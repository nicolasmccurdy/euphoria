require 'test_helper'

class RoomsControllerTest < ActionController::TestCase
  setup do
    @room = rooms(:kitchen)
    @room.world = worlds(:earth)
  end

  test 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:rooms)
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should create room' do
    assert_difference('Room.count') do
      post :create, room: { name: 'New Room', world_id: @room.world_id }
    end

    assert_redirected_to room_path(assigns(:room))
  end

  test 'should not create invalid room' do
    assert_no_difference('Room.count') do
      post :create, room: { name: 'Kitchen' }
    end
  end

  test 'should show room' do
    get :show, id: @room
    assert_response :success
  end

  test 'should get edit' do
    get :edit, id: @room
    assert_response :success
  end

  test 'should update room' do
    patch :update, id: @room, room: { description: @room.description, name: @room.name, world_id: @room.world_id }
    assert_redirected_to room_path(assigns(:room))
  end

  test 'should not update invalid room' do
    assert_no_difference('Room.count') do
      patch :update, id: @room, room: { name: 'Basement' }
    end
  end

  test 'should destroy room' do
    assert_difference('Room.count', -1) do
      delete :destroy, id: @room
    end

    assert_redirected_to rooms_path
  end
end
