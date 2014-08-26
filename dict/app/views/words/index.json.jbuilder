json.array!(@words) do |word|
  json.extract! word, :id, :word_en, :word_other, :know, :dont_know, :not_sure
  json.url word_url(word, format: :json)
end
