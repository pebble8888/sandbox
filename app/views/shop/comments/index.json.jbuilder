json.array!(@shop_comments) do |shop_comment|
  json.extract! shop_comment, :id, :content
  json.url shop_comment_url(shop_comment, format: :json)
end
