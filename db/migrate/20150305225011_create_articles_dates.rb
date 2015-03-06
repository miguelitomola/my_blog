class CreateArticlesDates < ActiveRecord::Migration
  def change
    create_table :articles_dates do |t|
      t.integer :day
      t.string :month
      t.integer :year
      t.timestamps
    end
  end
end
