json.extract! submission, :id, :title, :story, :price, :created_at, :updated_at
json.url submission_url(submission, format: :json)