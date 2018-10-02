class CreateCameras < ActiveRecord::Migration[5.2]
  def change
    create_table :cameras, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
      t.string :make
      t.string :model
      t.string :lens_info
      t.string :lens_make
      t.string :lens_model
      t.string :thumbnail_id
      t.string :url
      t.integer :user_id

      t.timestamps
    end
  end
end
