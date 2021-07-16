class DropFileColumn < ActiveRecord::Migration[6.1]
  def change
    remove_column :link_builders, :file
  end
end
