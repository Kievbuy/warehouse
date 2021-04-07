class DestinationsReferences < ActiveRecord::Migration[6.1]
  def change
    create_table :destinations_references, :id => false do |t|
      t.integer :destination_id
      t.integer :reference_id
    end
  end
end
