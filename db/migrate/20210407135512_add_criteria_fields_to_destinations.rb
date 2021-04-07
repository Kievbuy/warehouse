class AddCriteriaFieldsToDestinations < ActiveRecord::Migration[6.1]
  def change
    add_column :destinations, :max_price, :integer
  end
end
