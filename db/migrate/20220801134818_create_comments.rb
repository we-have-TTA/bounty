class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.text :content
      t.integer :user_id
      t.integer :article_id
      t.integer :order

      t.timestamps
    end
  end
end
