class CreateArticlesDates < ActiveRecord::Migration
  def change
    create_table :articles_dates do |t|

      t.timestamps
    end
  end
end
