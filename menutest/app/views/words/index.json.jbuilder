json.array!(@words) do |word|
  json.extract! word, :id, :word_a, :word_b
  json.url word_url(word, format: :json)
end
