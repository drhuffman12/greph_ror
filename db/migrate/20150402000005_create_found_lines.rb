class CreateFoundLines < ActiveRecord::Migration
  def change
    create_table :found_lines do |t|
      t.integer :found_file_id
      t.integer :found_line_num
      t.string :found_line_string

      t.text :search_term_list
      t.integer :search_term_count
      t.integer :result_entry_count

      t.timestamps null: false
    end
  end
end
