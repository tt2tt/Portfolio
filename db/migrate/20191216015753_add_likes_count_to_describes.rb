class AddLikesCountToDescribes < ActiveRecord::Migration[5.2]
  def change
    add_column :describes, :likes_count, :integer, null: false, default: 0
  end
end
