class CreateCrmings < ActiveRecord::Migration[5.1]
  def change
    create_table :crmings do |t|
      t.references :crm, index: true
      t.references :crmable, polymorphic: true, index: true

      t.timestamps
    end
  end
end
