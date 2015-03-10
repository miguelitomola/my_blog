class ArticlesDate < ActiveRecord::Base
	has_many :articles
	validates :day, presence: true
	validates :month, presence: true
	validates :year, presence: true

	def month_into_spanish month_integer
		spanish_months = {1 => "Enero", 2 => "Febrero", 3 => "Marzo", 4 => "Abril", \
		 5 => "Mayo", 6 => "Junio", 7 => "Julio", 8 => "Agosto", 9 => "Septiembre", \
		 10 => "Octubre", 11 => "Noviembre", 12 => "Diciembre"}
		month_in_spanish = spanish_months[month_integer]
    return month_in_spanish
	end

  def set_dates (@article)
  	day = @article.created_at.day
  	month_integer = @article.created_at.month
  	month = month_into_spanish month_integer
  	year = @article.created_at.year

  	check_date = ArticlesDate.where("day like ?", day).where("month like ?", \
  		month_integer).where("year like ?", year)

  	if check_date.empty? == false #It means there are an ArticlesDate object of that day 
  		@article.article_dates_id = check_date.id
    else
      #Keep working here! 
  end

end
  	#where("origin like ?", "%#{origin}%").where("destination like ?", "%#{destination}%").where("from_date like ?", "%#{fechaida}%")
  	#where("user_name = ? AND password = ?", user_name, password)
