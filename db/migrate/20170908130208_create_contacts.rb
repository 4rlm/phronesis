class CreateContacts < ActiveRecord::Migration[5.1]
  def change
    create_table :contacts do |t|
      t.string :status
      t.string :source
      t.string :first_name
      t.string :last_name
      t.string :email

      t.timestamps
    end
  end
end
