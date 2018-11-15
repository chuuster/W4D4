class AddStudioColumnToAlbums < ActiveRecord::Migration[5.2]
  def change
    add_column :albums, :studio_recording, :boolean, default: true
  end
end
