class Article < ActiveRecord::Base
	has_many :comments , dependent: :destroy
	belongs_to :articles_date
	validates :title, presence: true,
	                  length: { minimum: 5 }
end

def search_by_month (year, month)
	@articles_by_month = Article.where(year: year).where(month: month)
end