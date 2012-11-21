class AddShoeIdToEntries < ActiveRecord::Migration
  def change
    add_column :entries, :shoe_id, :integer
  end
end
