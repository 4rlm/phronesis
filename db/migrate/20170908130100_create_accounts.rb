class CreateAccounts < ActiveRecord::Migration[5.1]
  def change
    create_table :accounts do |t|
      t.string :status
      t.string :source

      t.timestamps
    end
  end
end
