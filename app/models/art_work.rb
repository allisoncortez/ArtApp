class ArtWork < ApplicationRecord
    has_one_attached :image
    belongs_to :user
    belongs_to :challenge
    has_many :comments
    # has_many :users, through: :comments 

    #validations
    # validates :title, presence: true



    #scope methods
    # scope :alpha, -> { order(:title) }

    #maybe one for challenges: most participants(users) using this logic
    # scope :most_comments, -> {joins(:comments).group('posts.id').order('count(posts.id) desc'}



end
