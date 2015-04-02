json.array!(@found_lines) do |found_line|
  json.extract! found_line, :id, :found_file_id, :found_line_num
  json.url found_line_url(found_line, format: :json)
end
