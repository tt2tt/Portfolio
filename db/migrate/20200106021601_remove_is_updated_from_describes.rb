class RemoveIsUpdatedFromDescribes < ActiveRecord::Migration[5.2]
  def change
    remove_column :describes, :is_updated, :boolean
  end
end
