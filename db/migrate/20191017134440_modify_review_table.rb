class ModifyReviewTable < ActiveRecord::Migration[5.2]
  def up
    remove_column :reviews, :body
    add_column :reviews, :comment, :text, null: true
  end
  def down
    add_column :reviews, :body, :text, null: false
    remove_column :reviews, :comment
  end
end
