class CreateColors < ActiveRecord::Migration[5.2]
  def change
    create_table :colors, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
      t.string :name
      t.integer :photo_id

      t.timestamps
    end
  end
end
