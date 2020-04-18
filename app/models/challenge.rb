class Challenge < ApplicationRecord

    has_many :art_works
    has_many :users, through: :art_works
    
    #scope methods
    scope :alpha, -> {order(:name)}


    #maybe one for challenges: most participants(users) using this logic
    # scope :most_comments, -> {joins(:comments).group('posts.id').order('count(posts.id) desc'}
end
