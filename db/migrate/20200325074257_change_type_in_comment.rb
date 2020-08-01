class ChangeTypeInComment < ActiveRecord::Migration[6.0]
  def change
    remove_column :comments, :user_id
    remove_column :comments, :film_id
    add_reference :comments, :user, foreign_key: true
    add_reference :comments, :film, foreign_key: true
  end
end
