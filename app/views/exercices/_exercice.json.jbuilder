json.extract! exercice, :id, :name, :slug, :user_id, :course_id, :created_at, :updated_at
json.url exercice_url(exercice, format: :json)