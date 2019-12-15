class AddColumnToDescribes < ActiveRecord::Migration[5.2]
  def change
    add_column :describes, :likes_counts, :integer
  end
end
