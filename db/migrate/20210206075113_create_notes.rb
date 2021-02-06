class CreateNotes < ActiveRecord::Migration[6.1]
  def change
    create_table :notes do |t|
      t.string "title"
      t.text "body"
      t.integer "user_id"
      t.string "guid"
      t.integer "notebook_id"
      t.timestamps
    end
  end
end
