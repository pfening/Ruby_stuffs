class CreateWords < ActiveRecord::Migration
  def change
    create_table :words do |t|
      t.string :word_a
      t.string :word_b

      t.timestamps
    end
  end
end
