class Article < ActiveRecord::Base
	has_many :comments , dependent: :destroy
	belongs_to :articles_date
	validates :title, presence: true,
	                  length: { minimum: 5 }
end

#This must be an instance method, so no self
#must be written
def search_by_month (year, month)
	dates_by_month = ArticlesDate.where(year: year).where(month: month)
	array_articles_by_month = []
	c = 0
	while c < dates_by_month.length
	  array_articles_by_month.push(Article.where(articles_date: dates_by_month[c].id))
	  c += 1	
	end
	#array_articles_by_month is an array whith arrays of articles into it
	#I iterate these arrays to have just articles in another array (@articles_by_month)
	@articles_by_month = []
	array_articles_by_month.each do |articles|
		articles.each do |article|
			@articles_by_month.push(article)
		end
	end
  return @articles_by_month
end