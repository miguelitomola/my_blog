class ArticlesDate < ActiveRecord::Base
	has_many :articles
	validates :day, presence: true
	validates :month, presence: true
	validates :year, presence: true

	def self.month_into_spanish month_integer
		spanish_months = {1 => "Enero", 2 => "Febrero", 3 => "Marzo", 4 => "Abril", \
		 5 => "Mayo", 6 => "Junio", 7 => "Julio", 8 => "Agosto", 9 => "Septiembre", \
		 10 => "Octubre", 11 => "Noviembre", 12 => "Diciembre"}
		month_in_spanish = spanish_months[month_integer]
    return month_in_spanish
	end

  def self.set_dates article
  	day = article.created_at.day
  	month_integer = article.created_at.month
  	month = month_into_spanish month_integer
  	year = article.created_at.year

    #Let's check if there is already an object ArticlesDate of this day
  	check_date = ArticlesDate.where(day: day).where(month: \
  		month).where(year: year)

  	if check_date.any? #It means there are an ArticlesDate object of the day 
      #We asign this articles_date.id to article pushing ActiveRecord hash / array
      check_date.last.articles.push(article)  
    else
      ArticlesDate.create(day: day, month: month, year: year)
      #We asign this articles_date.id to article pushing ActiveRecord hash / array
      ArticlesDate.last.articles.push(article) 
    end
  end

end

