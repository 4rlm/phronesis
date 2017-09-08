class CreatePhonings < ActiveRecord::Migration[5.1]
  def change
    create_table :phonings do |t|
      t.references :phone, index: true
      t.references :phonable, polymorphic: true, index: true

      t.timestamps
    end
  end
end
