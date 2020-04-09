class CreateArtPieces < ActiveRecord::Migration[6.0]
  def change
    create_table :art_pieces do |t|
      t.string :title 
      t.string :social_handle
      t.belongs_to :user, foreign_key: true
      t.belongs_to :challenge, foreign_key: true

      t.timestamps
    end
  end
end
