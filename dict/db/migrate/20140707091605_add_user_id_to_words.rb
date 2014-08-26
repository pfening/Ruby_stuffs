class AddUserIdToWords < ActiveRecord::Migration
  def change
    add_column :words, :user_id, :intiger
  end
end
