# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

def create_articles number
  if defined? Article.last.title
    tit_array = Article.last.title.split
    art_number = tit_array[1].to_i
    while art_number < number
      art_number = art_number + 1
      title = "#{tit_array[0]} #{art_number}"
      art = Article.create(
        title: title
        )
      ArticlesDate.set_dates art
    end
  else 
    art = Article.create(
      title: 'Artículo 1'
      )
    ArticlesDate.set_dates art
    create_articles @@articles_number
  end
end

def add_body_to_articles
  Article.all.each do |article|
    article.body = 'Lorem ipsum dolor sit amet,
              consectetur adipisicing elit.
              Cupiditate beatae facilis deleniti
              cumque eligendi error totam deserunt 
              ex ut exercitationem reiciendis 
              aperiam aspernatur vitae, reprehenderit 
              eum soluta. Odit, quibusdam quod!'
    article.save
  end
end

@@articles_number = 4
create_articles @@articles_number
add_body_to_articles

               