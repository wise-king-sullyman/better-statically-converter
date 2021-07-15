class CreateLinkBuilders < ActiveRecord::Migration[6.1]
  def change
    create_table :link_builders do |t|
      t.string :commit
      t.string :file

      t.timestamps
    end
  end
end
