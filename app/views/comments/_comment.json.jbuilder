json.extract! comment, :id, :content, :user_id, :article_id, :order, :created_at, :updated_at
json.url comment_url(comment, format: :json)
