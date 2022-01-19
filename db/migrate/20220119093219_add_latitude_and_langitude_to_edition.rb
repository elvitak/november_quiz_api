class AddLatitudeAndLangitudeToEdition < ActiveRecord::Migration[6.1]
  def change
    add_column :editions, :latitude, :float
    add_column :editions, :longitude, :float
  end
end
