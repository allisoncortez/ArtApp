class RemoveArtPieceIdFromComments < ActiveRecord::Migration[6.0]
  def change
    remove_column :comments, :art_piece_id, :integer
  end
end
