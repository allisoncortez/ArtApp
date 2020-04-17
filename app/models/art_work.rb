class ArtWork < ApplicationRecord
    has_one_attached :image
    belongs_to :user
    belongs_to :challenge
    has_many :comments
    

    #validations
    validates :title, presence: true



    



end
