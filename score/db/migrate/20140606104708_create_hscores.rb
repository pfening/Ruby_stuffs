class CreateHscores < ActiveRecord::Migration
  def change
    create_table :hscores do |t|
      t.string :game
      t.integer :score

      t.timestamps
    end
  end
end
