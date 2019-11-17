class AddRateToWatchRelations < ActiveRecord::Migration[5.0]
  def change
    add_column :watch_relations, :rate, :integer
  end
end
