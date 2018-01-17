class CategoriesController < ApplicationController
  
  
  def new
    @category = Category.new
  end
  
  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = "Category saved"
      redirect_to categories_path      
    else
      
      render 'new'
    end
  end
  
  def show
    
  end
  
  def index
    @categories = Category.all 
  end
      
  private 
  
  def category_params
    params.require(:category).permit(:name)
  end
   
end
