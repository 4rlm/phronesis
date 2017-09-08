class CreateCrms < ActiveRecord::Migration[5.1]
  def change
    create_table :crms do |t|
      t.string :crm_id
      t.string :type
      t.string :source
      t.references :crm, index: true

      t.timestamps
    end
  end
end
