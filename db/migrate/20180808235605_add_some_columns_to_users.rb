class AddSomeColumnsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :birth_year, :integer
    add_column :users, :birth_month, :integer
    add_column :users, :birth_day, :integer
    add_column :users, :gender, :integer, limit: 1, default: 0, null: false
    add_column :users, :header_image_id, :string
    add_column :users, :thumbnail_id, :string
    add_column :users, :user_type, :integer, limit: 1, default: 0, null: false
  end
end
