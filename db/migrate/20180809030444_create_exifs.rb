class CreateExifs < ActiveRecord::Migration[5.2]
  def change
    create_table :exifs, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
      t.string :make
      t.string :model
      t.string :lens_info
      t.string :lens_make
      t.string :lens_model
      t.float :alitude
      t.string :longitude
      t.string :latitude
      t.datetime :shooting_date
      t.integer :photo_id

      t.timestamps
    end
  end
end
