class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
    t.integer	:clothe_id
    t.integer	:user_id
    t.string	:review
      t.timestamps
    end
  end
end
