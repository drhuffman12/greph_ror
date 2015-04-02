class CreateFoundFiles < ActiveRecord::Migration
  def change
    create_table :found_files do |t|
      t.string :found_file_path

      t.text :search_term_list
      t.integer :search_term_count
      t.integer :result_entry_count
      t.integer :file_line_count

      t.timestamps null: false
    end
  end
end
