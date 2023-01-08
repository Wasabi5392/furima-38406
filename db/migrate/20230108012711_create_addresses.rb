class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.references :purchase_log,    null: false, foreign_key: true
      t.integer    :prefecture_id,   null: false
      t.string     :post_code,       null: false
      t.string     :city,            null: false
      t.string     :address,         null: false
      t.string     :building
      t.string     :phone_number,    null: false
      t.timestamps
    end
  end
end
