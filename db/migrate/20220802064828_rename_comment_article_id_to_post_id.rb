class RenameCommentArticleIdToPostId < ActiveRecord::Migration[6.1]
  def change
    rename_column :comments, :article_id, :post_id
  end
end
