class AddUserIdToPost < ActiveRecord::Migration[6.1]
  def change
    remove_column :posts, :user_id, :integer
    add_belongs_to :posts, :user
  end
end
