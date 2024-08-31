class ListItem < ActiveRecord::Migration[7.1]
  def change
    create_table :list_items do |t|
      t.string :content, null: false
      t.references :list, null: false, foreign_key: true

      t.timestamps
    end
  end
end
