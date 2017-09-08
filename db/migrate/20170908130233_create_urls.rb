class CreateUrls < ActiveRecord::Migration[5.1]
  def change
    create_table :urls do |t|
      t.string :url
      t.boolean :valid
      t.index :url, unique: true

      t.timestamps
    end
  end
end
