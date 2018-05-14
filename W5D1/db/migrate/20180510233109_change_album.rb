class ChangeAlbum < ActiveRecord::Migration[5.1]
  def change
    remove_index :albums, :band_id
  end
end
