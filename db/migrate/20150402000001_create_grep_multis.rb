class CreateGrepMultis < ActiveRecord::Migration
  def change
    create_table :grep_multis do |t|
      t.text :search_terms
      t.text :search_paths

      t.timestamps null: false
    end
  end
end
