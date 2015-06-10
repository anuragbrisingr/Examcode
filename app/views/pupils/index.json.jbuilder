json.array!(@pupils) do |pupil|
  json.extract! pupil, :id
  json.url pupil_url(pupil, format: :json)
end
