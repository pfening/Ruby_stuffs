json.array!(@hscores) do |hscore|
  json.extract! hscore, :id, :game, :score
  json.url hscore_url(hscore, format: :json)
end
