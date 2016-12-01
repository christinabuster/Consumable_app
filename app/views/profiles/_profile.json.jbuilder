json.extract! profile, :id, :name, :birthday, :about_me, :created_at, :updated_at
json.url profile_url(profile, format: :json)