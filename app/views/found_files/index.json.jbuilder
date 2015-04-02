json.array!(@found_files) do |found_file|
  json.extract! found_file, :id, :found_file_path
  json.url found_file_url(found_file, format: :json)
end
