class CreateFilmProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :film_profiles do |t|
      t.string :resolution
      t.datetime :release_date
      t.text :description
      t.datetime :time
      t.integer :film_id

      t.timestamps
    end
  end
end
