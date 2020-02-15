class CreateDescribeTags < ActiveRecord::Migration[5.2]
  def change
    create_table :describe_tags do |t|
      t.references :describe, foreign_key: true
      t.references :tag, foreign_key: true

      t.timestamps
    end
  end
end
