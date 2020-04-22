class ArtWork < ApplicationRecord
    has_one_attached :image
    belongs_to :user
    belongs_to :challenge
    has_many :comments, dependent: :destroy
    
    validates :title, presence: true
    validate :correct_image

    scope :title, -> {order(:title)}


    private
    def correct_image
        if image.attached? && !image.content_type.in?(%w(image/jpeg image/png))
            errors.add(:image, 'must be a JPEG or PNG.')
        elsif image.attached? == false 
            errors.add(:image, 'required.')
        end
    end

end
