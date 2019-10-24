class CreateAddTotalColumnToReviews < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :total, :integer, default: 0
  end
end
