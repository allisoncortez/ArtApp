class RenameArtPiecesToArtworks < ActiveRecord::Migration[6.0]
  def self.up
    rename_table :art_pieces, :artworks
  end

  def self.down
    rename_table :artworks, :art_pieces
  end
end
