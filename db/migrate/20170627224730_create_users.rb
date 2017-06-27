class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string, :name
      t.string, :last_name
      t.string, :mail
      t.string :password
      t.string :,
      t.string, :photo
      t.boolean, :state
      t.boolean :administrator

      t.timestamps
    end
  end
end
