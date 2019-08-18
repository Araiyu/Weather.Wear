class AddClothesTextToClothes < ActiveRecord::Migration[5.2]
  def change
    add_column :clothes, :clothe_text, :string
  end
end
