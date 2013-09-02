json.array!(@definitions) do |definition|
  json.extract! definition, :word, :definition
  json.url definition_url(definition, format: :json)
end
