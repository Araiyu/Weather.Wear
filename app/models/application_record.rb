class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  attachment :user_image
end
