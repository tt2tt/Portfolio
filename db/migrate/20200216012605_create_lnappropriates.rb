class CreateLnappropriates < ActiveRecord::Migration[5.2]
  def change
    create_table :lnappropriates do |t|
      t.references :user, foreign_key: true
      t.references :describe, foreign_key: true

      t.timestamps
    end
  end
end
