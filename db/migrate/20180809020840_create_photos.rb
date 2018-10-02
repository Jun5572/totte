class CreatePhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :photos, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
      t.string :image_id
      t.string :title
      t.integer :camera_id
      t.integer :user_id
      t.integer :event_id
      t.integer :company_id
      t.integer :color_id
      t.integer :like_count, default: 0, null: false
      t.integer :category_id

      t.timestamps
    end
  end
end
