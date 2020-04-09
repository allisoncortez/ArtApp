class User < ApplicationRecord
    has_many :art_pieces
    has_many :challenges, through: :art_pieces

    has_many :comments
    has_many :comments_on_art, through: :comments, source: art_piece

    
end
