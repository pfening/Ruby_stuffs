class AddDictIdToWords < ActiveRecord::Migration
  def change
    add_column :words, :dict_id, :intiger
  end
end
