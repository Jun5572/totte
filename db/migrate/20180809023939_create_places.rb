class CreatePlaces < ActiveRecord::Migration[5.2]
  def change
    create_table :places do |t|
      t.string :name
      t.string :postal_code
      t.string :pref
      t.string :city
      t.string :address1
      t.string :address2
      t.integer :event_id
      t.integer :company_id

      t.timestamps
    end
  end
end
