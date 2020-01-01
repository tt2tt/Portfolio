class AddCommentsCountToDescribes < ActiveRecord::Migration[5.2]
  def self.up
    add_column :describes, :comments_count, :integer, null: false, default: 0
  end

  def self.down
    remove_column :describes, :comments_count
  end
end
