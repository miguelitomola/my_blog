class AddColumnsToArticles < ActiveRecord::Migration
  def change
  	#add_column :table_name, :column_name, :type
  	add_column :articles, :article_number, :integer
  end
end
