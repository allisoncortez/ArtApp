class User < ApplicationRecord
    has_many :artworks
    has_many :challenges, through: :artworks

    has_many :comments
    # has_many :comments_on_art, through: :comments, source: art_piece

    has_secure_password
    #authenticate, validate password/password confirmation

    
end
