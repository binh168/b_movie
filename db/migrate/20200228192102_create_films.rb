class CreateFilms < ActiveRecord::Migration[6.0]
  def change
    create_table :films do |t|
      t.string :name
      t.string :country
      t.string :movie
      t.string :trailer
      t.string :image
      t.integer :category_id

      t.timestamps
    end
  end
end
