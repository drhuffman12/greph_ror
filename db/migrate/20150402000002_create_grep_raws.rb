class CreateGrepRaws < ActiveRecord::Migration
  def change
    create_table :grep_raws do |t|
      t.integer :grep_multi_id
      t.string :search_term
      t.string :search_path
      t.string :cmd
      t.text :result_set
      t.text :error_log

      t.timestamps null: false
    end
  end
end
