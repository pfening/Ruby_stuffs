class CreateDictionaries < ActiveRecord::Migration
  def change
    create_table :dictionaries do |t|
      t.string :word_en
      t.string :word_other
      t.boolean :know
      t.boolean :dont_know
      t.boolean :not_sure

      t.timestamps
    end
  end
end
