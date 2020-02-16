class AddLnappropriatesCountToDescribes < ActiveRecord::Migration[5.2]
  def self.up
    add_column :describes, :lnappropriates_count, :integer, null: false, default: 0
  end

  def self.down
    remove_column :describes, :lnappropriates_count
  end
end
