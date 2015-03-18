json.array!(@steps) do |step|
  json.extract! step, :id, :content, :list_id
  json.url step_url(step, format: :json)
end
