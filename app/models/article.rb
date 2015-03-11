class Article < ActiveRecord::Base
	has_many :comments , dependent: :destroy
	belongs_to :articles_date
	validates :title, presence: true,
	                  length: { minimum: 5 }
end
