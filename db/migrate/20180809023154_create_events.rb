class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
      t.string :name
      t.text :detail
      t.integer :type, default: 0, null: false
      t.datetime :open_date
      t.datetime :close_date
      t.integer :place_id
      t.integer :user_id
      t.integer :company_id
      t.integer :interest_count, default: 0, null: false

      t.timestamps
    end
  end
end
