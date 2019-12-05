class AddUserRefToDescribes < ActiveRecord::Migration[5.2]
  def change
    add_reference :describes, :user, foreign_key: true
  end
end
