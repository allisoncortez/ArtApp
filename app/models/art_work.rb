class ArtWork < ApplicationRecord
    belongs_to :user
    belongs_to :challenge
    has_many :comments
    # has_many :users, through: :comments 

    # validates :title, presence: true
end
