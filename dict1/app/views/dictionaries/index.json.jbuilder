json.array!(@dictionaries) do |dictionary|
  json.extract! dictionary, :id, :word_en, :word_other, :know, :dont_know, :not_sure
  json.url dictionary_url(dictionary, format: :json)
end
