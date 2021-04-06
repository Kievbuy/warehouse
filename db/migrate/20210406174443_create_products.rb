class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :name
      t.string :reference
      t.references :category
      t.integer :price

      t.timestamps
    end
  end
end
