class AddReferencesToMovie < ActiveRecord::Migration[5.1]
  def change
    remove_column :movies, :gender
    remove_column :movies, :category
    add_reference :movies, :category, index: true, foreign_key: true
    add_reference :movies, :gender, index: true, foreign_key: true
  end
end
