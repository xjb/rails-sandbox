json.extract! book, :id, :title, :type, :description, :book_id, :created_at, :updated_at
json.url book_url(book, format: :json)
