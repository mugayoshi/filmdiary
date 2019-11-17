class CreateWatchRelations < ActiveRecord::Migration[5.0]
  def change
    create_table :watch_relations do |t|
      t.references :user, foreign_key: true
      t.references :film, foreign_key: true

      t.timestamps
      
      t.index [:user_id, :film_id], unique: true
    end
  end
end
