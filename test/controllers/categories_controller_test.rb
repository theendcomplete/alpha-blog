require "test_helper"

class CategoriesControllerTest < ActionController::TestCase
  
  def setup
   @category = Category.create(name: "sports")
    @user = User.create(username: "John admin", email: "Johny@johny.com", password: "password", admin: true)
  end
    
  test "shoild get catefories index" do
    get :index
    assert_response :success
  end
  
   test "shoild get new" do
     session[:user_id] = @user.id
     get :new
    assert_response :success
  end
  
  
   test "shoild get show" do
     get(:show, {'id' => @category.id})
    assert_response :success
  end
  
  test "should redirect create when admin is not logged in" do
   assert_no_difference 'Category.count' do 
     post :create, category: {name: "Sports"}
     end
      assert_redirected_to categories_path
   end
  
end
