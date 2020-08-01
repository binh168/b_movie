class CreateRatings < ActiveRecord::Migration[6.0]
  def change
    create_table :ratings do |t|
      t.integer :star
      t.integer :user_id
      t.integer :film_id

      t.timestamps
    end
  end
end
