class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.integer :isbn
      t.string :name
      t.text :description
      t.text :image_url

      t.timestamps
    end
  end
end
