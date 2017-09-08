class CreateUrlings < ActiveRecord::Migration[5.1]
  def change
    create_table :urlings do |t|
      t.references :url, index: true
      t.references :urlable, polymorphic: true, index: true

      t.timestamps
    end
  end
end
