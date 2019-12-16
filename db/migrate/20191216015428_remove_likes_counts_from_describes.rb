class RemoveLikesCountsFromDescribes < ActiveRecord::Migration[5.2]
  def change
    remove_column :describes, :likes_counts, :integer
  end
end
