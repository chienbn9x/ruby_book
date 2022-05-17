class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|
      t.string :Contact_receiver
      t.string :Contact_phone
      t.text :Contact_address
      t.boolean :Addr_default

      t.timestamps
    end
  end
end
