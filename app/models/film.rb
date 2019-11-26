class Film < ApplicationRecord
  mount_uploader :image, ImageUploader
  validates :title, presence: true, uniqueness: true, length: { maximum: 100 }
  validates :director, presence: true, length: { maximum: 50 }
  validates :image, presence: true
  validates :lang, presence: true
  validates :description, presence: true
  
  def self.search(search)
    if search
      Film.where(['title LIKE ?', "%#{search}%"])
    else
      Film.all
    end
  end
  
end
