class CreateDescribes < ActiveRecord::Migration[5.2]
  def change
    create_table :describes do |t|
      t.string :title
      t.text :content
      t.json :images
      t.boolean :is_updated, default: false, null: false

      t.timestamps
    end
  end
end
