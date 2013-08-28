json.array!(@styles) do |style|
  json.extract! style, :name, :description
  json.url style_url(style, format: :json)
end
