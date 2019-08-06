class CreateClothes < ActiveRecord::Migration[5.2]
  def change
    create_table :clothes do |t|

    	t.integer	:user_id
    	t.integer	:genre_id
    	t.string	:temperature
    	t.string	:weather
    	t.string	:rainy_percent
    	t.string	:clothes_image_id
    	t.datetime   :created_at
      	t.datetime   :updated_at
    	t.timestamps

    end
  end
end
