class AddColumnReceiveToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :receive, :boolean, default: true
  end
end
