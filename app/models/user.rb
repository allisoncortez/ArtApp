class User < ApplicationRecord
    has_many :art_works
    has_many :challenges, through: :art_works

    has_many :comments
    

    has_secure_password
    

    validates :first_name, :email, presence: true
    validates :password, length: { in: 6..20 }

end
