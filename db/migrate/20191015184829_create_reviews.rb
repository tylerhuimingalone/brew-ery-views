class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.integer :rating, null: false
      t.text :body, null: false

      t.belongs_to :brewery

      t.timestamps null: false
    end
  end
end
