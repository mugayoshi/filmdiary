class User < ApplicationRecord
  before_save { self.email.downcase! }
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  #has_secure_password is Rails' default function
  
  has_many :watch_relations
  has_many :watched_films, through: :watch_relations, source: :film
  
  def watch(film, rate, comment)
    self.watch_relations.find_or_create_by(film_id: film.id, rate: rate, comment: comment)
  end
  
  def undo_watch(film)
    watch_relation = self.watch_relations.find_by(film_id: film.id)
    watch_relation.destroy if watch_relation
  end
  
  def watched?(film)
    self.watched_films.include?(film)
  end
end
