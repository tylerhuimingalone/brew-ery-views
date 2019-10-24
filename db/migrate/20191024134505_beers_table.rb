class BeersTable < ActiveRecord::Migration[5.2]
  def change
    create_table :beers do |t|
      t.string :name, null: false
      t.string :beer_type
      t.text :description
      t.belongs_to :brewery

      t.timestamps
    end
  end
end
