json.array!(@pins) do |pin|
  json.extract! pin, :id, :name, :pin_pi, :value
  json.url pin_url(pin, format: :json)
end
