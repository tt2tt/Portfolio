class CreateDescribeCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :describe_categories do |t|
      t.references :describe, foreign_key: true
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
