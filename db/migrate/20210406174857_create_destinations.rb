class CreateDestinations < ActiveRecord::Migration[6.1]
  def change
    create_table :destinations do |t|

      t.timestamps
    end
  end
end
