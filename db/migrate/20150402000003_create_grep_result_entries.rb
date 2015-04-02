class CreateGrepResultEntries < ActiveRecord::Migration
  def change
    create_table :grep_result_entries do |t|
      t.integer :grep_raw_id
      # t.string :found_file_path
      t.integer :found_file_id
      t.integer :found_line_id
      # t.integer :found_line_num
      # t.string :found_line_string

      t.timestamps null: false
    end
  end
end
