class AddNameUniqueness < ActiveRecord::Migration[5.2]
  def change
    add_index :breweries, :name, unique: true
  end
end
