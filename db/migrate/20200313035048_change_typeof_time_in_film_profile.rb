class ChangeTypeofTimeInFilmProfile < ActiveRecord::Migration[6.0]
  def change
    change_column :film_profiles, :time, :integer
  end
end
