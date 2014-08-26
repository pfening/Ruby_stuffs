class CreateWords < ActiveRecord::Migration
  def change
    create_table :words do |t|
      t.string :word_a
      t.string :word_b
      t.boolean :know
      t.integer :language_id

      t.timestamps
    end
  end
end
