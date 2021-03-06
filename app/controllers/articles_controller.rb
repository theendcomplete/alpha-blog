class ArticlesController < ApplicationController 
	before_action :set_article, only: [:edit, :update, :show, :destroy]
	def index
		@articles = Article.paginate(page: params[:page], per_page: 2)
	end
	
	def new
		@article = Article.new
	end
	
	def edit
	end
		
	def create
			#debugger
	  	@article = Article.new(article_params)
			@article.user = User.first
  		if @article.save
			flash[:success] = "Article was successfully created"
			redirect_to article_path(@article)
		else
			render 'new'
		end
  end
	
	def update
		if @article.update(article_params)
			flash[:success] = "Article was updated"
			redirect_to article_path(@article)
		else
			render 'edit'
		end
	end	
	
	def destroy
		@article.destroy
		flash[:danger] = "Article was deleted"
		redirect_to articles_path
	end
		
  def show
		@article = Article.find(params[:id])
	end
	
	private
	def set_article
		@article = Article.find(params[:id])
	end
	
	def article_params
	  params.require(:article).permit(:title, :description, category_ids: [] )
	end
	
	def require_same_user
		if current_user != @article.user and !current_user.admin?
			flash[:danger] = "You can only delete and edit your own articles"
			redirect_to root_path
		end
	end	
end