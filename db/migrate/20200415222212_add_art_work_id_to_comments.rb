class AddArtWorkIdToComments < ActiveRecord::Migration[6.0]
  def change
    add_reference :comments, :art_work, foreign_key: true
  end
end
