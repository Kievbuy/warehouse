class AddReferenceAndDestinationToProducts < ActiveRecord::Migration[6.1]
  def change
    add_reference :products, :reference
    add_reference :products, :destination
  end
end
