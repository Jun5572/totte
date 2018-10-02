class CreatePostComments < ActiveRecord::Migration[5.2]
  def change
    create_table :post_comments, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
      t.text :comment
      t.integer :user_id
      t.integer :photo_id

      t.timestamps
    end
  end
end
