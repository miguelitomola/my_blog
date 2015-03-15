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

  def self.print_dates
    dates_aside = {}
    dates = ArticlesDate.all
    #If there are not dates, dates aside remains empty. Otherwise, loop over every date.
    dates.length < 1 ? dates_aside : dates.each do |date|
      #First, I keep years in a aside_years if it does not keep them yet
      aside_year = date.year
      if dates_aside.include?(aside_year) == false
        #As the year is not in dates_aside variable, I keep it as key and its value is
        #a empty array wich will keep the months.
        dates_aside[aside_year] = []
      end
      #I iterate all the dates of aside_year and keep them in dates_by_year
      dates_by_year = ArticlesDate.where(year: aside_year)
      #Then I iterate those years to keep the months in dates aside if they don't exist.
      dates_by_year.each do |date_y|
        aside_month = date_y.month
        if dates_aside[aside_year].include?(aside_month) == false
          dates_aside[aside_year].push(aside_month)
        end
      end
    end
    return dates_aside
  end
end

