class RenameArtPiecesToArtworks < ActiveRecord::Migration[6.0]
  def self.up
    rename_table :art_pieces, :art_works
  end

  def self.down
    rename_table :art_works, :art_pieces
  end
end
