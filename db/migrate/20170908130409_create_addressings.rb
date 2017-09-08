class CreateAddressings < ActiveRecord::Migration[5.1]
  def change
    create_table :addressings do |t|
      t.references :address, index: true
      t.references :addressable, polymorphic: true, index: true

      t.timestamps
    end
  end
end
