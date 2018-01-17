require "test_helper"

class CategoriesControllerTest < ActionController::TestCase
  
  def setup
   @category = Category.create(name: "sports")
  end
    
  test "shoild get catefories index" do
    get :index
    assert_response :success
  end
  
   test "shoild get new" do
     get :new
    assert_response :success
  end
  
  
   test "shoild get show" do
     get(:show, {'id' => @category.id})
    assert_response :success
  end
end
