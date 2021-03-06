class Challenge < ApplicationRecord
    has_many :art_works
    has_many :users, through: :art_works
    
    scope :alpha, -> {order(:name)}

end
