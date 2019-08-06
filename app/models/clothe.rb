class Clothe < ApplicationRecord

belongs_to :user
attachment :clothes_image
end