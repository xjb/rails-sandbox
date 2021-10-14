class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string :title
      t.string :type
      t.text :description
      t.references :book, null: false, foreign_key: true

      t.timestamps
    end
  end
end
