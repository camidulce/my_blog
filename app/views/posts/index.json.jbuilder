json.array!(@posts) do |post|
  json.extract! post, :id, :subject, :body, :published_at, :draft_status
  json.url post_url(post, format: :json)
end
