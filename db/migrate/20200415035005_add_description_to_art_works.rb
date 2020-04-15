class AddDescriptionToArtWorks < ActiveRecord::Migration[6.0]
  def change
    add_column :art_works, :description, :text
  end
end
