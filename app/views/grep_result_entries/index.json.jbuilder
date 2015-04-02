json.array!(@grep_result_entries) do |grep_result_entry|
  json.extract! grep_result_entry, :id, :grep_raw_id, :found_file_path, :found_line_num, :found_line_string
  json.url grep_result_entry_url(grep_result_entry, format: :json)
end
