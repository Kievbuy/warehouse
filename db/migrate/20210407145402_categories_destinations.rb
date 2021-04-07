class CategoriesDestinations < ActiveRecord::Migration[6.1]
  def change
    create_table :categories_destinations, :id => false do |t|
      t.integer :category_id
      t.integer :destination_id
    end
  end
end
