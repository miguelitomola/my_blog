class ArticlesController < ApplicationController

	before_action :require_admin, only: [:new, :edit, :create, :update, :destroy]
	# before_action :set_article_years
	# before_action :set_article_months

	def index
    last_id = Article.last.id	
    @articles_1 = [Article.last, Article.find_by(id:last_id-2), Article.find_by(id:last_id-4)]
    @articles_2 = [Article.find_by(id:last_id-1), Article.find_by(id:last_id-3), Article.find_by(id:last_id-5)]
  end

  def show
  	@article = Article.find(params[:id])
    if UserSession.find != nil 
      @username = UserSession.find.user.username
    end
  end
	
	def new
		@article = Article.new
	end

  def edit
    @article = Article.find(params[:id])
  end

	def create
		@article = Article.new(article_params)

		if @article.save
      #article_date = @article.updated.updated_at
      #article_date.updated_at
		  redirect_to @article
		else
			render 'new'
		end
	end

	def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
    	render 'edit'	
    end
	end

	def destroy
		@article = Article.find(params[:id])
		@article.destroy

		redirect_to articles_path
	end

  private
    def article_params
    	params.require(:article).permit(:title, :body)
    end

    # def set_article_years
    # 	@years = []
    #   all_articles = Article.all
    # 	all_articles.each do |article|
    # 		article_year = article.created_at.year
    # 		@years == []? @years << article_year :
    # 		@years.each do |year|
    # 	    (article_year == year)? next: @years << article_year
    # 	  end
    # 	end
    # end

    # def set_article_months
    # 	@months = []
    #   all_articles = Article.all
    # 	all_articles.each do |article|
    # 		@article_month = article.created_at.month
    # 		@months | [@article_month]
    # 	end
    # end      		 

end
