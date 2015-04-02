json.array!(@grep_raws) do |grep_raw|
  json.extract! grep_raw, :id, :search_term, :search_path, :result_set, :error_log
  json.url grep_raw_url(grep_raw, format: :json)
end
