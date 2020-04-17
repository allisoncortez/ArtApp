class User < ApplicationRecord
    has_many :art_works
    has_many :challenges, through: :art_works

    has_many :comments
    # has_many :comments_on_art, through: :comments, source: art_piece

    has_secure_password
    #authenticate, validate password/password confirmation

    validates :first_name, :email, presence: true
    validates :password, length: { in: 6..20 }

    # validates :password

    
end
