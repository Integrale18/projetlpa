json.extract! student, :id, :name, :birthday, :surname, :lat, :lon, :created_at, :updated_at
json.url student_url(student, format: :json)
