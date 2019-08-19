class Clothe < ApplicationRecord
	belongs_to :user
	has_many :comments, dependent: :destroy
	attachment :clothes_image
end