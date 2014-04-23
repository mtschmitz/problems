json.array!(@problems) do |problem|
  json.extract! problem, :user_id, :name, :description
  json.url problem_url(problem, format: :json)
end