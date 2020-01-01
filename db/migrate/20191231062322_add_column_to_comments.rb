class AddColumnToComments < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :comment_number, :integer, default: 0
    add_column :comments, :reply_comment_id, :integer, default: 0
  end
end
