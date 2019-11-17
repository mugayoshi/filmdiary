class AddCommentToWatchRelations < ActiveRecord::Migration[5.0]
  def change
    add_column :watch_relations, :comment, :text
  end
end
