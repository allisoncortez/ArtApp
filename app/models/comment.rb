class Comment < ApplicationRecord
    belongs_to :user
    belongs_to :art_work

    validates :content, presence: true

    # validates :post, uniqueness: {scope: :user_id, message:"only one comment per user"}
end
