class CreateFilms < ActiveRecord::Migration[5.0]
  def change
    create_table :films do |t|
      t.string :title
      t.string :director
      t.string :image
      t.date :release_date
      t.string :original_title
      t.string :lang
      t.text :description

      t.timestamps
    end
  end
end
