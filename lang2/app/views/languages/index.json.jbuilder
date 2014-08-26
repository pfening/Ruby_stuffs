json.array!(@languages) do |language|
  json.extract! language, :id, :lang_a, :lang_b
  json.url language_url(language, format: :json)
end
