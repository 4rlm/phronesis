class CreateOrgs < ActiveRecord::Migration[5.1]
  def change
    create_table :orgs do |t|
      t.string :name
      t.index :org, unique: true

      t.timestamps
    end
  end
end
