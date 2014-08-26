class CreateLanguages < ActiveRecord::Migration
  def change
    create_table :languages do |t|
      t.string :lang_a
      t.string :lang_b

      t.timestamps
    end
  end
end
