json.array!(@menus) do |menu|
  json.extract! menu, :id, :item
  json.url menu_url(menu, format: :json)
end
