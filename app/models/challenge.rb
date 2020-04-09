class Challenge < ApplicationRecord
    has_many :art_pieces
    has_many :users, through: :art_pieces
end
