class AddCommentsOriginalIdToDescribes < ActiveRecord::Migration[5.2]
  def change
    add_column :describes, :original_id, :integer
  end
end
