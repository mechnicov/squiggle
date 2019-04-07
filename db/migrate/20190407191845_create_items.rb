class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.integer :price, null: false
      t.text :description
      t.string :photo
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
