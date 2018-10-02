class CreateInterests < ActiveRecord::Migration[5.2]
  def change
    create_table :interests, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
      t.integer :user_id
      t.integer :event_id

      t.timestamps
    end
  end
end
