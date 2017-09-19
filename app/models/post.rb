class Post < ApplicationRecord
	attachment :image
	validates :title, presence: true
end
