class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.integer :role, null: false, default: 9
      t.references :prefecture, null: false

      t.timestamps
    end
  end
end
