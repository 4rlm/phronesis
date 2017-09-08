class CreateAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :addresses do |t|
      t.string :street
      t.string :city
      t.string :zip
      t.string :state
      t.string :full_address
      t.string :address_pin
      t.references :address, index: true

      t.timestamps
    end
  end
end
