class CreateMenus < ActiveRecord::Migration
  def change
    create_table :menus do |t|
      t.string :item

      t.timestamps
    end
  end
end
