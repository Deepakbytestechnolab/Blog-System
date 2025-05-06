json.extract! blog, :id, :title, :content, :tags, :published, :user_id, :created_at, :updated_at
json.url blog_url(blog, format: :json)
