json.extract! foody, :id, :first_name, :last_name, :email, :user_name, :password, :created_at, :updated_at
json.url foody_url(foody, format: :json)