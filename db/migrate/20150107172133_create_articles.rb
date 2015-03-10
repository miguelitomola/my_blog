class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
    	t.string :title
    	t.text :body
    	# this line adds an integer column called `articles_date_id`
    	t.references :article_dates, index: true
      t.timestamps
    end
  end
end
