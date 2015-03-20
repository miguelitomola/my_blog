class ArticlesController < ApplicationController

	before_action :require_admin, only: [:new, :edit, :create, :update, :destroy]
	

	def index
    if Article.last != nil 
      six_articles = Article.order(created_at: :desc).limit(6)
      @articles_1 = [six_articles[0], six_articles[2], six_articles[4]]
      @articles_2 = [six_articles[1], six_articles[3], six_articles[5]]
    else
      @articles_1 = []
      @articles_2 = []
    end
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
      ArticlesDate.set_dates @article
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
  
  #Here the page with the articles ordered by month
  def month_results
    #to retrieve the parameters from the url
    url = URI.parse(request.original_url)
    query = CGI.parse(url.query)
    month_year = query["query"][0].split
    @year = month_year[1].to_i
    @month = month_year[0]
    search_by_month(@year, @month)
    render 'month_results'
  end

  private
    def article_params
    	params.require(:article).permit(:title, :body)
    end   	 
end
