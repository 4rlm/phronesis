class CreateOrgings < ActiveRecord::Migration[5.1]
  def change
    create_table :orgings do |t|
      t.references :org, index: true
      t.references :orgable, polymorphic: true, index: true

      t.timestamps
    end
  end
end
