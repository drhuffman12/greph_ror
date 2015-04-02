json.array!(@grep_multis) do |grep_multi|
  json.extract! grep_multi, :id, :search_terms, :search_paths
  json.url grep_multi_url(grep_multi, format: :json)
end
