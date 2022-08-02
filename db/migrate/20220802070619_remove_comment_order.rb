class RemoveCommentOrder < ActiveRecord::Migration[6.1]
  def change
    remove_column :comments, :order, type: :integer
  end
end
