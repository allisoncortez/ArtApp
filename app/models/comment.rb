class Comment < ApplicationRecord
    belongs_to :user
    belongs_to :art_work

    validates :content, presence: true

end
