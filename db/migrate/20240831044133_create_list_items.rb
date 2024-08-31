class CreateListItems < ActiveRecord::Migration[7.1]
  def change
    create_table :list_items do |t|

      t.timestamps
    end
  end
end
