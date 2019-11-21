class Film < ApplicationRecord
  mount_uploader :image, ImageUploader
  
  def self.search(search)
    if search
      Film.where(['title LIKE ?', "%#{search}%"])
    else
      Film.all
    end
  end
  
end
