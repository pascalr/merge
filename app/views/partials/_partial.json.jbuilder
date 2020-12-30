json.extract! partial, :id, :name, :content, :created_at, :updated_at
json.url partial_url(partial, format: :json)
